class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post
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

  def edit
  end

  def update

  end

  def destroy

  end

  private

  def set_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end

end
