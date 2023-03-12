# frozen_string_literal: true

class Posts::PostComponent < ViewComponent::Base
  def initialize(post:)
    @post = post
  end
end
