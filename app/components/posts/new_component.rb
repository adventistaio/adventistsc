# frozen_string_literal: true

class Posts::NewComponent < ViewComponent::Base
  def initialize(post:)
    @post = post
  end

end
