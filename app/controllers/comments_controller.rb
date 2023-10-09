class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  def index
    @comments = current_user.comments.includes(:post)
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
end
