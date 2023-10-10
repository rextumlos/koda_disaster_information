class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
  before_action :set_comment, only: [:edit, :update, :destroy]
  def index
    @comments = current_user.comments.includes(:post)
  end

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Comment created successfully"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Comment creation failed"
      redirect_to post_path(@post)
    end

  end

  def edit; end

  def update
    if @comment.update(comment_params)
      flash[:notice] = "Comment updated successfully"
      redirect_to post_path(@post)
    else
      flash[:alert] = "Comment update failed"
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment.destroy
    flash[:notice] = "Comment deleted successfully"
    redirect_to post_path(@post)
  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
