# Bigbank Ruby Client
[![CircleCI](https://circleci.com/gh/MrTin/bigbank-client.svg?style=svg)](https://circleci.com/gh/MrTin/bigbank-client)

## Installation
Add it to your Gemfile:

```ruby
gem 'bigbank-client'
```

## Bigbank requirements
- You need to send them an `IP or IP Range` for them to whitelist requests from
your servers.
- Request a `partner key` to authorize your requests.

## Configuration

```ruby
# Available endpoints:
# - Estonia: https://www.bigbank.ee/
# - Latvia: https://www.bigbank.lv/
# - Lithuania: https://www.bigbank.lt/
# - Finland: https://www.bigbank.fi/
# - Sweden: https://www.bigbank.se/
# - Spain: https://www.bigbank.es/

Bigbank::Client.configure do |config|
  config.endpoint = "https://ansok.bigbank.se/"
  config.partner_key = "super-secret-partner-key"
  # config.adapter = Faraday.default_adapter
  # config.verify_ssl = true
  # config.enable_proxy = false
  # config.proxy = "https://username:password@proxy.example.com/"
end
```
(If you are using Rails you can create an initializer at
`config/initializers/bigbank_client.rb`)

## Usage
### Fields
This will return a list of all the fields available for you to dynamically
build an application form for requesting loan contracts.
```ruby
response = Bigbank::Client::Fields.all
# => #<Faraday::Response:0x007fab1f117c28...

response.body
# => [{"input_type"=>"text", "input_name"=>"Lånebelopp", "input_id"=>"100"...
```

## Using a proxy
If you are running into SSL issue while making `https://` requests you are
advised to set `verify_ssl = false`. Just don't do this in production unless
you need to (to eg. make a proxy work) because this opens up an attack vector
on your software.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run
`rake test` to run the tests. You can also run `bin/console` for an interactive
prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To
release a new version, update the version number in `version.rb`, and then run
`bundle exec rake release`, which will create a git tag for the version, push
git commits and tags, and push the `.gem` file to
[rubygems.org](https://rubygems.org).

## Contributing
Bug reports and pull requests are welcome on GitHub at
https://github.com/mrtin/bigbank-client. This project is intended to be a safe,
welcoming space for collaboration, and contributors are expected to adhere to
the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License
The gem is available as open source under the terms of the
[MIT License](http://opensource.org/licenses/MIT).
