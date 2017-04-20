module Bigbank
  module Client
    class Fields
      def self.all
        self.new.all
      end

      def all
        response = connection.get("?get=values&key=#{config.partner_key}")
        puts response.body
      end

      # TODO: share this connection object
      def connection
        @connection ||=
          ::Faraday.new(url: config.endpoint) do |builder|
            builder.options[:open_timeout] = config.open_timeout
            builder.options[:timeout] = config.timeout
            builder.adapter config.adapter
          end
      end

      # TODO: share this code?
      def config
        Bigbank::Client.config
      end
    end
  end
end
