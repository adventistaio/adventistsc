# frozen_string_literal: true

class Shared::CommentsInfoComponent < ViewComponent::Base
  def initialize(count:, controller:)
    @count = count
    @controller = controller
  end
end
