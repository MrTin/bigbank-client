module Bigbank
  module Client
    class Config
      attr_accessor :endpoint,
                    :partner_key,
                    :open_timeout,
                    :timeout,
                    :adapter,
                    :verify_ssl,
                    :enable_proxy,
                    :proxy

      def initialize
        @endpoint = "https://ansok.bigbank.se/"
        @open_timeout = 5
        @timeout = 15
        @adapter = Faraday.default_adapter
        @verify_ssl = true
        @enable_proxy = false
        @proxy = ""
      end

      def enable_proxy?
        !!enable_proxy
      end
    end
  end
end
