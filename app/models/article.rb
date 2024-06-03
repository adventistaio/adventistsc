class Article < ApplicationRecord
  belongs_to :user
  has_many :likes, as: :reactable, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy

  enum state: {draft: 0, in_review: 1, rejected: 2, approved: 3, published: 4, archived: 5}
end
