# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'initialization' do
    it 'set reaction value to like(0) value' do
      subject = build(:like)
      expect(subject.reaction).to eq 'like'
    end
  end

  describe 'enums' do
    it { should define_enum_for(:reaction).with_values(like: 1) }
  end

  describe '#likeable' do
    it 'return the same as reactable method' do
      subject = create(:like)
      expect(subject.likeable).to eq subject.reactable
    end
  end
end
