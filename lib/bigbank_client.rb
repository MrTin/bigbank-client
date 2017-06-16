require 'faraday'
require 'faraday_middleware'

require_relative "bigbank_client/version"
require_relative "bigbank_client/error"
require_relative "bigbank_client/config"
require_relative "bigbank_client/endpoint"
require_relative "bigbank_client/result"

require_relative "bigbank_client/endpoints/field"
require_relative "bigbank_client/endpoints/application"

module BigbankClient
  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= ::BigbankClient::Config.new
    yield(config)
  end
end

::BigbankClient.configure {}
