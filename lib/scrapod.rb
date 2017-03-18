# frozen_string_literal: true

require 'scrapod/version'
require 'scrapod/driver'

require 'capybara'
require 'capybara/webkit/configuration'

##
# A driver of remote headless scraping cluster for Capybara
# (aka remote Capybara Webkit).
#
module Scrapod
end

Capybara.register_driver :scrapod do |app|
  Scrapod::Driver.new app, Capybara::Webkit::Configuration.to_hash
end
