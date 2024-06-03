# frozen_string_literal: true

class Articles::ArticleComponent < ViewComponent::Base
  def initialize(title:, content_text:, user:)
    @title = title
    @content_text = content_text
    @user = user
  end

end
