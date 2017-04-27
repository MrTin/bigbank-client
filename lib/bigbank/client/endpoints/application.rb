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

        ApplicationResult.new(response, connection)
      end

      class ApplicationResult < Result
        attr_reader :connection

        def initialize(result, connection)
          # TODO: Better make the connection statically available?
          @connection = connection
          super(result)
        end

        # Public: Returns the downloaded contract
        #
        # Returns a @StringIO with the contract buffer or nil
        def contract
          @contract ||= download_contract
        end

        private

          # Internal: Downloads the contract
          #
          # Returns a @StringIO with the contract buffer or nil
          def download_contract
            response = connection.get(response["contract_file"])
            if response.success?
              buffer = StringIO.new(response.body)
              buffer.set_encoding("ASCII-8BIT")
            end

            buffer
          end
      end
    end
  end
end
