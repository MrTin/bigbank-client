module Bigbank
  module Client
    class Result
      attr_accessor :response

      def initialize(response)
        @response = response
      end

      # Allows us to work directly with the result in a more natural way e.g.
      # use enumerator methods, nil check etc.
      def method_missing(name, *args, &block)
        response.body.send(name, *args, &block)
      end
    end
  end
end
