# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_secure_password }
    it { should have_many(:email_verification_tokens).dependent(:destroy) }
    it { should have_many(:password_reset_tokens).dependent(:destroy) }
    it { should have_many(:sessions).dependent(:destroy) }
  end

  describe 'validations' do
    subject { User.new(email: 'user@domain.com', password_digest: BCrypt::Password.create('$ecr3t.key')) }
    it { should validate_presence_of(:email) }
    # it { should validate_uniqueness_of(:email) }
    it { should allow_value('user.email@example.com').for(:email) }
    it { should_not allow_value('example.com').for(:email) }
    it { should_not allow_value('foo@').for(:email) }
    it { should_not allow_value('@bar').for(:email) }
  end

  describe 'enums' do
    it do
      should define_enum_for(:role)
        .with_values(basic: 0, admin: 99)
    end
  end
end
