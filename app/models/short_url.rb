# frozen_string_literal: true

# ShortUrl
class ShortUrl < ApplicationRecord
  validates :original_url, presence: true, format: URL_REGEX
  validates :short_url, presence: true, uniqueness: { case_sensitive: false }

  after_destroy do |su|
    REDIS_APP.del su.short_url
  end
end
