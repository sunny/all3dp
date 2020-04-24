# frozen_string_literal: true

module All3DP
  # A "Configuration" is a set of items uploaded on All3DP.
  class Configuration
    attr_reader :id

    def initialize(id:)
      @id = id
    end

    def url
      "https://app.craftcloud3d.com/configuration/#{id}"
    end

    def self.create(model_urls:)
      items = model_urls.map { |url| { modelUrl: url } }
      result = All3DP::API.new.create_configuration(items: items)
      new(id: result.fetch("configurationId"))
    end
  end
end
