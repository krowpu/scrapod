# frozen_string_literal: true

# Required by 'capybara/webkit/connection'
module Capybara; end

require 'capybara/webkit/connection'

require 'socket'

module Scrapod
  ##
  # Implements the same public interface as {Capybara::Webkit::Connection}
  # except #pid method because it has no sense in case of remote server
  # (it calls {Scrapod::Server#pid} which raises {NotImplementedError}.
  # {Scrapod::Connection#restart} just restarts the connection, not server.
  #
  class Connection < Capybara::Webkit::Connection
    def initialize(options = {})
      @socket = nil
      @server = options[:server]
      connect
    end

    def host
      @server.host
    end

  private

    def attempt_connect
      @socket = TCPSocket.open host, port

      if defined? Socket::TCP_NODELAY
        @socket.setsockopt Socket::IPPROTO_TCP, Socket::TCP_NODELAY, true
      end

    rescue Errno::ECONNREFUSED
      @socket = nil
    end
  end
end
