# frozen_string_literal: true

class Shared::UserInfoComponent < ViewComponent::Base
  def initialize(user:)
    @user = user
  end

end
