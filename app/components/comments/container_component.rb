# frozen_string_literal: true

class Comments::ContainerComponent < ViewComponent::Base
  def initialize(commentable: ,stimulus_controller: nil)
    @commentable = commentable
    @stimulus_controller = stimulus_controller || @commentable.class.name.parameterize.pluralize
  end
end
