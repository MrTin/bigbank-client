module Bigbank
  module Client
    class Application < Endpoint
      attr_accessor :post_params

      def self.create(*args)
        self.new(*args).create
      end

      def initialize(post_params={})
        @post_params = post_params
      end

      def create
        response = connection.post do |request|
          request.url "/api/"
          request.params = { post: "data" }
          request.body = { key: config.partner_key }.merge!(post_params)
        end

        Result.new(response)
      end
    end
  end
end
