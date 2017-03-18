# coding: utf-8
# frozen_string_literal: true

lib = File.expand_path 'lib', File.dirname(__FILE__)

$LOAD_PATH.unshift lib unless $LOAD_PATH.include? lib

require 'scrapod/version'

Gem::Specification.new do |spec|
  spec.name     = 'scrapod'
  spec.version  = Scrapod::Version::VERSION
  spec.summary  = 'A driver of remote headless scraping cluster for Capybara'
  spec.homepage = 'https://github.com/krowpu/scrapod'
  spec.license  = 'MIT'

  spec.author = 'krowpu'
  spec.email  = 'krowpu@tightmail.com'

  spec.description = <<-END.split("\n").join ' '
    A driver of remote headless scraping cluster for Capybara
    (aka remote Capybara Webkit).
  END

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match %r{^(test|spec|features)/}
  end

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename f }
  spec.require_paths = %w(lib)

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake',    '~> 10.0'
end
