# frozen_string_literal: true

# bundle exec rspec spec/controllers/api/v1/short_urls_controller_spec.rb
require 'rails_helper'

RSpec.describe Api::V1::ShortUrlsController, type: :request do
  describe 'POST encode' do
    it 'returns errors status' do
      post '/api/v1/short_urls/encode', params: {}
      expect(response.status).to eq 422
    end

    it 'returns a successful response' do
      post '/api/v1/short_urls/encode', params: { original_url: 'https://vnexpress.net/' }
      expect(response).to be_successful
    end
  end

  describe 'POST decode' do
    it 'returns errors status' do
      post '/api/v1/short_urls/decode', params: {}
      expect(response.status).to eq 404
    end

    it 'returns a successful response' do
      UrlShortener::Encode.call('https://vnexpress.net/')

      post '/api/v1/short_urls/decode', params: { short_url: '1SYWqt' }
      expect(response).to be_successful
    end
  end
end
