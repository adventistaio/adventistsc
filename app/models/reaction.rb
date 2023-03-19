# frozen_string_literal: true

class Reaction < ApplicationRecord
  belongs_to :user
  belongs_to :reactable, polymorphic: true

  validates :reaction, presence: true
  validates :user, presence: true
  validates :reactable, presence: true

  validates :user_id, uniqueness: { scope: %i[reactable_id reactable_type] }
end
