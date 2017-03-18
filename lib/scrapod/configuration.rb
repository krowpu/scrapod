# frozen_string_literal: true

module Scrapod
  ##
  # Actually configuration for {Capybara::Webkit}.
  #
  module Configuration
    DEFAULT = {
      debug: false,
      timeout: 5,
      stderr: nil,

      allowed_urls: %w(*).freeze,
      block_unknown_urls: false,
      blocked_urls: [].freeze,

      proxy: nil,
      skip_image_loading: false,

      ignore_ssl_errors: false,
    }.freeze
  end
end
