# frozen_string_literal: true

class Like < Reaction
  alias_attribute :likeable, :reactable

  enum reaction: { like: 1 }

  after_initialize :defaults

  validates :user, uniqueness: { scope: :likeable }

  private

  def defaults
    self.reaction = :like
  end
end
