# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates :user, presence: true
  validates :commentable, presence: true
  validates :comment, presence: true

  after_create_commit :broadcast_after_create
  after_destroy_commit :broadcast_after_destroy

  private

  def broadcast_after_destroy
    broadcast_render_to :comments,
                        partial: 'comments/destroy',
                        locals: { commentable:, comment: self }
  end

  def broadcast_after_create
    broadcast_render_to :comments,
                        partial: 'comments/create',
                        locals: { commentable:, comment: self }
  end
end
