class UsersController < ApplicationController
    before_action :ensure_logged_in, only: [:show, :edit, :update, :destroy]
    before_action :ensure_logged_out, only: [:new, :create]

    def show
        @user = User.find_by(id: params[:id])
        render :show
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login!(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            flash.now[:username] = @user.username
            render :new
        end
    end

    def edit

    end

    def update

    end

    def destroy

    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end