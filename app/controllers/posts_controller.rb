class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  def index
    @posts = current_user.posts.includes(:categories)
  end

  def show; end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      flash[:notice] = 'Post created successfully'
      redirect_to root_path
    else
      flash.now[:alert] = 'Post creation failed'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update

  end

  def destroy

  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content, :address, :image, category_ids: [])
  end

end
