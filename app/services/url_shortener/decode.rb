# frozen_string_literal: true

# app/services/url_shortener/decode.rb
module UrlShortener
  class Decode < ApplicationService
    def initialize(short_url)
      @short_url = short_url
    end

    def call
      return nil if @short_url.blank?

      # Redis
      original_url = REDIS_APP.get @short_url
      return original_url if original_url.present?

      # Database
      raw = ShortUrl.find_by(short_url: @short_url)
      return nil if raw.nil?

      # Redis
      REDIS_APP.set @short_url, raw.original_url

      raw.original_url
    end
  end
end
