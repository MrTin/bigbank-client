require_relative "client/version"
require_relative "client/error"
require_relative "client/config"

module Bigbank
  module Client
    class << self
      attr_accessor :config
    end

    def self.configure
      self.config ||= Bigbank::Client::Config.new
      yield(config)
    end
  end
end
