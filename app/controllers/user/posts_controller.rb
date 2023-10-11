class User::PostsController < ApplicationController
  def index
    @posts = current_user.posts.includes(:categories)
                         .order(comments_count: :desc)
                         .page(params[:page]).per(5)
  end
end

