class SubsController < ApplicationController
  before_action :ensure_moderator, only: [:edit]

  def ensure_moderator
    @sub = Sub.find_by(id: params[:id])
    redirect_to subs_url unless @sub.moderator_id == current_user.id
  end

  def index
    @subs = Sub.order("updated_at DESC")
    render :index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def update
    @sub = Sub.find_by(id: params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  def destroy
  end

  
  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
