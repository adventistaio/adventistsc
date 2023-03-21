class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar do |attachable|
    attachable.variant :xs, resize_to_limit: [24, 24]
  end

  validates_presence_of :name
end
