# frozen_string_literal: true

class Shared::SelectLangComponent < ViewComponent::Base
  def initialize(current:, available_locales:)
    @current = current
    @available_locales = available_locales
  end

end
