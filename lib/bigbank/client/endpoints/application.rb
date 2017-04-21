module Bigbank
  module Client
    class Application < Endpoint
      attr_accessor :params

      def self.create(*args)
        self.new(*args).create
      end

      def initialize(params)
        @params = params
      end

      def create
        response = connection.post do |request|
          request.url "/api/?post=data"
          request.params = { key: config.partner_key }.merge!(params)
        end

        Result.new(response)
      end
    end
  end
end
