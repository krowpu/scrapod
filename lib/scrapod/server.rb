# frozen_string_literal: true

module Scrapod
  ##
  # Implements the same public interface as {Capybara::Webkit::Server}
  # except #pid method because it has no sense in case of remote server.
  #
  class Server
    attr_reader :host, :port

    def initialize(host: '127.0.0.1', port: 20_885)
      self.host = host
      self.port = port
    end

    def start; end

    def pid
      raise NotImplementedError, "#{self.class}#pid has no sense in case of remote server"
    end

  private

    def host=(host)
      raise TypeError, "Expected host to be a #{String}" unless host.is_a? String
      @host = host.dup.freeze
    end

    def port=(port)
      raise TypeError, "Expected port to be an #{Integer}" unless port.is_a? Integer
      @port = port
    end
  end
end
