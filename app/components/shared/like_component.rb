# frozen_string_literal: true

class Shared::LikeComponent < ViewComponent::Base
  def initialize(like:, likeable:)
    @like = like
    @likeable = likeable
    @likes_count = @likeable.likes.count
  end
end
