class SubsController < ApplicationController
  before_action :ensure_moderator, only: [:edit]

  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit

  end

  def update
  end

  def destroy
  end

  
  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
