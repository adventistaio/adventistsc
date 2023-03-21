# frozen_string_literal: true

class CommentsController < ApplicationController
  before_action :set_commentable, only: :create
  before_action :set_comment, only: :destroy

  def create
    @comment = @commentable.comments.build(user: Current.user,
                                           comment: comment_params[:comment])

    return unless @comment.save
  end

  def destroy
    @commentable = @comment.commentable
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:commentable_type, :commentable_id, :comment)
  end

  def reaction_params
    params.require(:comment).permit(reactable_id:, reactable_type:)
  end

  def set_commentable
    @commentable = comment_params[:commentable_type].classify
                                                    .constantize
                                                    .includes(:comments)
                                                    .find(comment_params[:commentable_id])
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end
end
