module Bigbank
  module Client
    class Config
      attr_accessor :endpoint

      def initialize
        @endpoint = "https://ansok.bigbank.se/api"
      end
    end
  end
end
