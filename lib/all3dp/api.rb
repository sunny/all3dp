# frozen_string_literal: true

module All3DP
  # Handle all calls to the API.
  class API
    class Error < StandardError; end

    def create_configuration(items:)
      url = "#{BASE_URL}/configuration"
      response = HTTP.post(
        url,
        headers: { "use-model-urls" => true },
        json: { items: items },
      )

      raise Error, response.body.to_s.inspect if response.code != 201

      response.parse
    end

    # private

    BASE_URL = "https://printing-engine.all3dp.com"
    private_constant :BASE_URL
  end
end
