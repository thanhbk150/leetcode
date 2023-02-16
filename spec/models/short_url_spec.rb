# frozen_string_literal: true

# bundle exec rspec spec/models/short_url_spec.rb
require 'rails_helper'

RSpec.describe ShortUrl, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:original_url) }
    it { is_expected.to validate_presence_of(:short_url) }
    # it { is_expected.to validate_uniqueness_of(:short_url) }
  end
end
