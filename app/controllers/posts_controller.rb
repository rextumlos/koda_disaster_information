class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :validate_user, only: [:edit, :update, :destroy]

  def show
    @comments = @post.comments.includes(:user)
                     .order(created_at: :desc)
                     .page(params[:page]).per(5)
    @comment = @post.comments.build
  end

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

  def edit
    session[:return_to] ||= request.referer
  end

  def update
    if @post.update(post_params)
      flash[:notice] = 'Post updated successfully'
      redirect_to session.delete(:return_to)
    else
      flash.now[:alert] = 'Post update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post deleted successfully.'
    redirect_to root_path
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def validate_user
    return if @post.user == current_user
    flash[:alert] = 'Unauthorized access'
    redirect_to post_path(@post)
  end

  def post_params
    params.require(:post).permit(:title, :content, :address, :image, category_ids: [])
  end

end
