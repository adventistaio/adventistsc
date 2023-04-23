# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :reactable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  has_one_attached :image

  validates :content, presence: true
  validates :user, presence: true

  def current_user_like
    likes.find_by(user: Current.user)
  end
end
