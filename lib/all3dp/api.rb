# frozen_string_literal: true

module All3DP
  # Handle all calls to the API.
  class API
    class Error < StandardError; end
    class BadGatewayError < Error; end
    class GatewayTimeoutError < Error; end
    class ServiceUnavailableError < Error; end

    def create_configuration(items:)
      json = { items: items }
      response = json_post("#{BASE_URL}/configuration", json)

      JSON.parse(response_body(response))
    end

    private

    BASE_URL = "https://api.craftcloud3d.com/v4"
    private_constant :BASE_URL

    def response_body(response)
      body = response.body.to_s.strip

      case response.code
      when "201" then body
      when "502" then raise BadGatewayError, body
      when "503" then raise ServiceUnavailableError, body
      when "504" then raise GatewayTimeoutError, body
      else raise Error, "Error #{response.code}: #{body.inspect}"
      end
    end

    def json_post(url, json)
      uri = URI.parse(url)
      request = Net::HTTP::Post.new(uri)
      request.content_type = "application/json; charset=UTF-8"
      request["use-model-urls"] = "true"
      request.body = JSON.dump(json)
      req_options = { use_ssl: uri.scheme == "https" }

      Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end
    end
  end
end
