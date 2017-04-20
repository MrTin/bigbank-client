module Bigbank
  module Client
    class Fields < Endpoint
      def self.all
        self.new.all
      end

      def all
        response = connection.get do |request|
          request.url "/api/?get=values&key=#{config.partner_key}"
        end

        response
      end
    end
  end
end
