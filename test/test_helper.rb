$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)

require "bigbank_client"

require "minitest/autorun"
require "webmock/minitest"
require "vcr"

VCR.configure do |c|
  c.cassette_library_dir = "test/cassettes"
  c.hook_into :webmock
end
