require 'faraday'
require 'faraday_middleware'

require_relative "version"
require_relative "error"
require_relative "config"
require_relative "endpoint"
require_relative "result"

require_relative "endpoints/field"
require_relative "endpoints/application"

module BigbankClient
  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= BigbankClient::Config.new
    yield(config)
  end
end

BigbankClient.configure {}
