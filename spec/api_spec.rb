# frozen_string_literal: true

RSpec.describe All3DP::API do
  let(:api) { described_class.new }

  describe "#create_configuration" do
    it "returns a response" do
      stub_request(:post, "https://printing-engine.all3dp.com/configuration")
        .with(
          body: '{"items":[{"modelUrl":"http://example.org/file.stl"}]}',
          headers: {
            "Content-Type" => "application/json; charset=UTF-8",
            "Use-Model-Urls" => "true",
          },
        )
        .to_return(
          status: 201,
          headers: { "Content-Type" => "application/json; charset=UTF-8" },
          body: '{"configurationId":"some-configuration-id"}',
        )

      result = api.create_configuration(
        items: [
          { modelUrl: "http://example.org/file.stl" },
        ],
      )

      expect(result).to eq("configurationId" => "some-configuration-id")
    end
  end
end
