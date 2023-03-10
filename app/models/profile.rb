class Profile < ApplicationRecord
  belongs_to :user
  has_one_attached :avatar

  validates_presence_of :name
end
