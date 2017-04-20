module Bigbank
  module Client
    class Config
      attr_accessor :endpoint,
                    :partner_key,
                    :open_timeout,
                    :timeout,
                    :adapter

      def initialize
        @endpoint = "https://ansok.bigbank.se/api"
        @open_timeout = 5
        @timeout = 15
        @adapter = Faraday.default_adapter
      end
    end
  end
end
