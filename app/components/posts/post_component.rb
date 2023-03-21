# frozen_string_literal: true

include Turbo::FramesHelper

class Posts::PostComponent < ViewComponent::Base
  def initialize(post:, isolated: false)
    super
    @post = post
    @isolated = isolated
    @current_user_like = @post.current_user_like
  end

  def post_content_style(content)
    case content.length
    when 1..50
      'text-4xl font-bold py-16'
    when 51..150
      'text-2xl font-bold  py-16'
    else
      'text-md font-normal py-8'
    end
  end
end
