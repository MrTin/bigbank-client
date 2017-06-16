module BigbankClient
  class Result
    attr_accessor :response

    def initialize(response)
      @response = response
    end

    # Public: result is a success
    #
    # return @boolean
    def success?
      response.status == 200
    end

    # Public: result is a failure
    #
    # return @boolean
    def errors?
      !success?
    end

    # Allows us to work directly with the result in a more natural way e.g.
    # use enumerator methods, nil check etc.
    def method_missing(name, *args, &block)
      response.body.send(name, *args, &block)
    end
  end
end
