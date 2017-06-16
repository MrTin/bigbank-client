module BigbankClient
  class Field < Endpoint
    def self.all
      self.new.all
    end

    def all
      response = connection.get do |request|
        request.url "/api/"
        request.params = { get: "values", key: config.partner_key }
      end

      ::BigbankClient::Result.new(response)
    end
  end
end
