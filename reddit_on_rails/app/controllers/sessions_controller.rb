class SessionsController < ApplicationController

  before_action :ensure_logged_in, only: [:destroy]
  before_action :ensure_logged_out, only: [:new, :create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
