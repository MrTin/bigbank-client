module Bigbank
  module Client
    class Fields
      def self.all
        self.new.all
      end

      def all
        response = connection.get do |request|
          request.url "/api/?get=values&key=#{config.partner_key}"
        end

        response
      end

      # TODO: shared method?
      def connection
        @connection ||=
          ::Faraday.new(url: config.endpoint) do |builder|
            builder.response :json, :content_type => /\bjson$/
            builder.headers["User-Agent"] = user_agent
            builder.options[:open_timeout] = config.open_timeout
            builder.options[:timeout] = config.timeout
            builder.adapter config.adapter
            builder.ssl.verify = config.verify_ssl
            builder.proxy(config.proxy) if config.enable_proxy?
          end
      end

      # TODO: shared method?
      def config
        Bigbank::Client.config
      end

      # TODO: shared method?
      def user_agent
        "bigbank-client v#{::Bigbank::Client::VERSION} (github.com/mrtin/bigbank-client)"
      end
    end
  end
end
