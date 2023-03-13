# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :set_post, only: :destroy

  def new
    @post = Post.new
  end

  def create
    @post = Current.user.posts.build(post_params)

    if @post.save
      respond_to do |format|
        format.turbo_stream
      end
    else
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.turbo_stream
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def set_post
    @post = Current.user.posts.find(params[:id])
  end
end
