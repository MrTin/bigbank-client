module BigbankClient
  module Client
    class Endpoint
      def connection
        @connection ||=
          ::Faraday.new(url: config.endpoint) do |builder|
            builder.use ::Faraday::Request::UrlEncoded
            builder.response :json, :content_type => /\bjson$/
            builder.headers["User-Agent"] = user_agent
            builder.options[:open_timeout] = config.open_timeout
            builder.options[:timeout] = config.timeout
            builder.adapter config.adapter
            builder.ssl.verify = config.verify_ssl
            builder.proxy(config.proxy) if config.enable_proxy?
          end
      end

      def config
        ::BigbankClient::Client.config
      end

      def user_agent
        "bigbank-client v#{::BigbankClient::Client::VERSION} (github.com/mrtin/bigbank-client)"
      end
    end
  end
end
