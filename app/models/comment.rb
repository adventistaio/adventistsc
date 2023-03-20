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
    broadcast_remove_to :comments
  end

  def broadcast_after_create
    # broadcast_append_to :comments,
    #                     html: ApplicationController.render(Comments::CommentComponent.new(comment: self), layout: false),
    #                     target: "comments_#{commentable.class.name.parameterize}_#{commentable.id}"

    # broadcast_append_to :comments,
    #                     partial: 'comments/create',
    #                     locals: { commentable: commentable, comment: self },
    #                     target: "comments_#{commentable.class.name.parameterize}_#{commentable.id}"

    broadcast_append_to :comments,
                        partial: 'comments/create',
                        locals: { commentable:, comment: self }
                        # target: "comments_#{ commentable.class.name.parameterize}_#{commentable.id}"
  end
end
