# frozen_string_literal: true

module Api
  module V1
    # ShortUrlsController
    class ShortUrlsController < ApiController
      # POST /api/v1/short_urls/encode
      def encode
        original_url = params[:original_url] || ''

        if !!original_url.match(URL_REGEX)
          short_url = UrlShortener::Encode.call(original_url)

          render json: { url: short_url }, status: 200
        else
          render json: { message: "URL is invalid" }, status: 422
        end
      end

      # POST /api/v1/short_urls/decode
      def decode
        original_url = UrlShortener::Decode.call(params[:short_url])
        if original_url
          render json: { url: original_url }, status: 200
        else
          render json: { url: nil }, status: 404
        end
      end
    end
  end
end
