# frozen_string_literal: true

# JsonWebToken
module JsonWebToken
  HMAC_SECRET = Rails.application.secrets.secret_key_base

  # TODO: include ExceptionHandler

  def self.encode(payload)
    payload[:exp] = 24.hours.from_now.to_i
    JWT.encode(payload, HMAC_SECRET)
  end

  def self.decode(token)
    body = JWT.decode(token, HMAC_SECRET)[0]
    ActiveSupport::HashWithIndifferentAccess.new body
  rescue JWT::ExpiredSignature, JWT::VerificationError => e
    raise StandardError, e.message
    # raise ExceptionHandler::ExpiredSignature, e.message
  end
end
