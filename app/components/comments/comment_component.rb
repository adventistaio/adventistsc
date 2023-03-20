# frozen_string_literal: true

class Comments::CommentComponent < ViewComponent::Base
  def initialize(comment:)
    @comment = comment
  end
end
