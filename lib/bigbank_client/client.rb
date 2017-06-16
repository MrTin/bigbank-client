require 'faraday'
require 'faraday_middleware'

require_relative "client/version"
require_relative "client/error"
require_relative "client/config"
require_relative "client/endpoint"
require_relative "client/result"

require_relative "client/endpoints/field"
require_relative "client/endpoints/application"

module BigbankClient
  module Client
    class << self
      attr_accessor :config
    end

    def self.configure
      self.config ||= ::BigbankClient::Client::Config.new
      yield(config)
    end
  end
end

BigbankClient::Client.configure {}
