# frozen_string_literal: true

# bundle exec rspec spec/policies/user_spec.rb
require 'rails_helper'

describe UserPolicy do
  subject { described_class }

  permissions :index?, :show?, :new?, :create?, :edit? do
    it "grants access" do
      expect(subject).to permit(FactoryBot.create(:user), User.new)
    end
  end

  permissions :update?, :destroy? do
    it "denies access" do
      expect(subject).not_to permit(FactoryBot.create(:user), User.new)
    end
  end
end
