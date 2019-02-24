# frozen_string_literal: true

module All3DP
  # Handle all calls to the API.
  class API
    class Error < StandardError; end
    class BadGatewayError < Error; end
    class GatewayTimeoutError < Error; end
    class ServiceUnavailableError < Error; end

    def create_configuration(items:)
      url = "#{BASE_URL}/configuration"
      response = HTTP.post(
        url,
        headers: { "use-model-urls" => true },
        json: { items: items },
      )

      parse_response(response)
    end

    private

    BASE_URL = "https://printing-engine.all3dp.com"
    private_constant :BASE_URL

    # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    def parse_response(response)
      case response.code
      when 201
        response.parse
      when 502
        raise BadGatewayError, response.body.to_s.strip
      when 503
        raise ServiceUnavailableError, response.body.to_s.strip
      when 504
        raise GatewayTimeoutError, response.body.to_s.strip
      else
        raise Error, "Error #{response.code}: #{response.body.to_s.inspect}"
      end
    end
    # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
  end
end
