# frozen_string_literal: true

# ShortUrl
class ShortUrl < ApplicationRecord
  validates :original_url, presence: true
  validates_format_of :original_url, with: URL_REGEX, multiline: true
  validates :short_url, presence: true, uniqueness: { case_sensitive: false }

  after_destroy do |su|
    REDIS_APP.del su.short_url
  end
end
