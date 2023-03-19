# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:likes) }
  end

  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { should validate_presence_of(:user) }
  end

  describe '#current_user_like' do
    it 'returns like for current user' do
      user = create :user
      post = create(:post)
      create(:like, user: create(:user), likeable: post)
      like = create(:like, user: user, reactable: post)
      create(:like, user: create(:user), reactable: post)
      allow(Current).to receive(:user).and_return(user)
      expect(post.current_user_like.id).to eq like.id
    end
  end
end
