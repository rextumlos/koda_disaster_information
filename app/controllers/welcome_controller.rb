class WelcomeController < ApplicationController
  def index
    @posts = Post.includes(:user, :categories).all
                 .order(comments_count: :desc)
                 .page(params[:page]).per(5)
  end
end
