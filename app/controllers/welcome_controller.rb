class WelcomeController < ApplicationController
  def index
    @posts = Post.includes(:user, :categories).all
  end
end
