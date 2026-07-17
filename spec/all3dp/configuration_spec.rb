# frozen_string_literal: true

RSpec.describe All3DP::Configuration do
  describe ".create" do
    subject(:create) { described_class.create(model_urls: model_urls) }

    let(:model_urls) { ["http://example.org/file.stl"] }

    it "returns a Configuration" do
      stub_request(:post, "https://customer-api.craftcloud3d.com/configuration")
        .with(
          body: '{"items":[{"modelUrl":"http://example.org/file.stl"}]}',
          headers: {
            "Content-Type" => "application/json; charset=UTF-8",
          },
        )
        .to_return(
          status: 201,
          headers: { "Content-Type" => "application/json; charset=UTF-8" },
          body: '{"configurationId":"some-configuration-id"}',
        )

      expect(create.id).to eq("some-configuration-id")
      expect(create.url).to eq(
        "https://craftcloud3d.com/configuration/some-configuration-id",
      )
    end
  end
end
