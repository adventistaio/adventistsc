# frozen_string_literal: true

class Shared::CommentComponent < ViewComponent::Base
  def initialize(comment:)
    @comment = comment
  end

end
