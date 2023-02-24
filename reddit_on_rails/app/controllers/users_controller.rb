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
        @user = current_user
        render :edit
    end

    def update
        @user = current_user
        if @user.update(user_params)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            flash.now[:username] = @user.username
            render :edit
        end
    end

    def destroy
        @user = current_user
        session[:session_token] = nil
        @user.destroy
        redirect_to new_session_url
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

end