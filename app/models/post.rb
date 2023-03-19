# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :reactable, dependent: :destroy

  validates :content, presence: true
  validates :user, presence: true

  def current_user_like
    likes.find_by(user: Current.user)
  end
end
