class PostsController < ApplicationController
  def index
    @posts = current_user.posts.includes(:categories)
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

end
