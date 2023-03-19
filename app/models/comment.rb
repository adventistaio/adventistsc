# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :user, presence: true
  validates :commentable, presence: true
  validates :comment, presence: true
end
