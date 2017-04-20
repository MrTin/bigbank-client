require "test_helper"

describe Bigbank::Client do
  subject { Bigbank::Client }
  let(:endpoint_url) { "https://ansok.bigbank.se/api" }
  let(:other_endpoint_url) { "http://another-apply.example.com/" }

  describe "version" do
    it "is set" do
      refute_nil subject::VERSION
    end
  end

  describe ".configure" do
    it "works" do
      assert_equal endpoint_url,
                   subject.config.endpoint,
                   "expected unconfigured endpoint to be '#{endpoint_url}'"

      subject.configure do |config|
        config.endpoint = other_endpoint_url
      end

      assert_equal other_endpoint_url,
                   subject.config.endpoint,
                   "expected changed endpoint to be '#{other_endpoint_url}'"
    end
  end
end
