# frozen_string_literal: true

# app/services/url_shortener/encode.rb
require 'base62'

module UrlShortener
  class Encode < ApplicationService
    def initialize(original_url)
      @original_url = original_url
    end

    def call
      return nil if @original_url.blank?

      short_url = generate_short_url
      if short_url.present?
        # Database
        ShortUrl.find_or_create_by!(short_url: short_url) do |t|
          t.short_url = short_url
          t.original_url = @original_url
        end

        # Redis
        REDIS_APP.set short_url, @original_url
      end

      short_url
    rescue ActiveRecord::RecordInvalid
      nil
    end

    private

    def generate_short_url
      # TODO: lam ngan chieu dai chuoi tra ve
      Digest::MD5.hexdigest(@original_url)[0..7].hex.base62_encode
    end
  end
end
