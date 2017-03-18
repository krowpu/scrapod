# frozen_string_literal: true

require 'capybara/webkit/driver'
require 'capybara/webkit/browser'

require 'scrapod/server'
require 'scrapod/connection'

module Scrapod
  ##
  # Same as {Capybara::Webkit::Driver} but creates Scrapod connection
  # to `tcp://127.0.0.1:20885` by default.
  #
  class Driver < Capybara::Webkit::Driver
    def initialize(app, options = {})
      @app = app
      @options = options.dup
      @options[:server] ||= Server.new options
      @browser = options[:browser] || Capybara::Webkit::Browser.new(Connection.new(@options))
      apply_options
    end
  end
end
