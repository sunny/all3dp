# frozen_string_literal: true

RSpec.describe All3DP::API do
  let(:api) { described_class.new }

  describe "#create_configuration" do
    let(:result) {
      api.create_configuration(
        items: [
          { modelUrl: "http://example.org/file.stl" },
        ],
      )
    }
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

      expect(result).to eq("configurationId" => "some-configuration-id")
    end

    context "when 502" do
      let(:body) {
        "<html>\r\n<head><title>502 Bad Gateway</title></head>\r\n" \
        "<body bgcolor=\"white\">\r\n" \
        "<center><h1>502 Bad Gateway</h1></center>\r\n" \
        "<hr><center>nginx/1.12.1</center>\r\n" \
        "</body>\r\n</html>\r\n"
      }

      it "raises an exception" do
        stub_request(:post, "https://printing-engine.all3dp.com/configuration")
          .to_return(status: 502, body: body)

        expect { result }
          .to raise_error(All3DP::API::BadGatewayError, body.strip)
      end
    end

    context "when 503" do
      it "raises an exception" do
        stub_request(:post, "https://printing-engine.all3dp.com/configuration")
          .to_return(status: 503, body: "")

        expect { result }
          .to raise_error(All3DP::API::ServiceUnavailableError, "")
      end
    end

    context "when 504" do
      it "raises an exception" do
        stub_request(:post, "https://printing-engine.all3dp.com/configuration")
          .to_return(status: 504, body: "")

        expect { result }.to raise_error(All3DP::API::GatewayTimeoutError, "")
      end
    end

    context "when unknown status code" do
      let(:status_code) { 432 }
      let(:body) { "meh" }

      it "raises an exception" do
        stub_request(:post, "https://printing-engine.all3dp.com/configuration")
          .to_return(status: status_code, body: body)

        expect { result }
          .to raise_error(All3DP::API::Error, 'Error 432: "meh"')
      end
    end
  end
end
