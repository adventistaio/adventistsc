# frozen_string_literal: true

class Like < Reaction
  alias_attribute :likeable, :reactable

  enum reaction: { like: 1 }

  after_initialize :defaults

  private

  def defaults
    self.reaction = :like
  end
end
