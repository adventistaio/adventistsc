require 'rails_helper'

RSpec.describe Reaction, type: :model do
  describe 'associations' do
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:reactable) }
  end

  describe 'validations' do
    subject { described_class.create(user: create(:user), reaction: 1, reactable: create(:post), type: 'Like') }
    it { should validate_presence_of(:reaction) }
    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:reactable) }
    it { should validate_uniqueness_of(:user_id).scoped_to(:reactable_id, :reactable_type) }
  end
end
