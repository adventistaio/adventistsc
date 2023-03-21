class HomeController < ApplicationController
  skip_before_action :authenticate, only: :index

  def index
    @posts = Post.includes(:comments, :likes, user: :profile).all.order(created_at: :desc)
  end
end
