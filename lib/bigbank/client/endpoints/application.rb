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
        attr_accessor :connection

        def initialize(result, connection)
          # TODO: Better make the connection statically available?
          @connection = connection
          super(result)
        end

        # Public: Returns the downloaded contract
        #
        # Returns a @Tempfile with the contract buffer or nil
        def contract
          @contract ||= download_contract
        end

        private

          # Internal: Downloads the contract
          #
          # Returns a @Tempfile with the contract buffer or nil
          def download_contract
            return nil unless response.success?

            contract_response = connection.get(response.body["contract_file"])
            if contract_response.success?
              buffer = Tempfile.new(["bigbank_client-contract", ".pdf"], encoding: "ascii-8bit")
              buffer.write(contract_response.body)
              buffer.rewind
            end

            buffer
          end
      end
    end
  end
end
