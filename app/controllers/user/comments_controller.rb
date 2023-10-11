class User::CommentsController < ApplicationController
  def index
    @comments = current_user.comments.includes(:post)
                            .order(created_at: :desc)
                            .page(params[:page]).per(5)
  end
end
