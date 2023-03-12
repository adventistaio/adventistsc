# frozen_string_literal: true

class PostsController < ApplicationController
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

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
