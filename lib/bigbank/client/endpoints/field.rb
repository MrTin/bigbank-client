module Bigbank
  module Client
    class Field < Endpoint
      def self.all
        self.new.all
      end

      def all
        response = connection.get do |request|
          request.url "/api/?get=values&key=#{config.partner_key}"
        end

        Result.new(response)
      end
    end
  end
end
