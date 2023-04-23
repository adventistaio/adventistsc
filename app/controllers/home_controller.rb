# frozen_string_literal: true

class HomeController < ApplicationController
  skip_before_action :authenticate, only: :index

  def index
    @pagy, @posts = pagy(Post.includes(:comments, :likes, user: :profile).all.order(created_at: :desc))
  end
end
