# frozen_string_literal: true

# bundle exec rspec spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_presence_of(:login) }

    it { should allow_value('user@example.com').for(:email) }
    it { should_not allow_value('user').for(:email) }
  end

  # context 'validations' do
  #   before { FactoryBot.build(:user) }
  # end
end
