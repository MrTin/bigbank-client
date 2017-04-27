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
**Rails:** put this inside an initializer at e.g.
`config/initializers/bigbank_client.rb`
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

## Usage
Endpoint requests will return a `Bigbank::Client::Result` or a child of this
class e.g. `Bigbank::Client::ApplicationResult` which you can then work with as
if it was an Enumerable.

Any method that you call and is not defined on the result class will be
forwarded to the resulting body which is a JSON hash. This means that you can
work directly with the result as an `Enumarable` calling e.g. `#each` or
`#count`. The following methods are however available on all results:
- `#success?`
- `#errors?`
- `#response` access the underlying request object (see [lostisland/faraday](https://github.com/lostisland/faraday) for more info).

### Example result
```ruby
fields = Bigbank::Client::Fields.all
#=> <Bigbank::Client::Result:0x007fc7698a3b48>

fields.each { |field| puts field }
```

## Supported endpoints
### Fields
Retrieve all fields to build a loan application form.
```ruby
fields = Bigbank::Client::Fields.all
# => <Bigbank::Client::Result:0x007fc7698a3b48>

fields.each { |field| puts field }
```

### Application
Create a loan application. You pass in the fields, they are however specific to
your application so you not to look up what fields you are expected to POST.
```ruby
response = Bigbank::Client::Application.create({
    ...
  })
# => #<Bigbank::Client::Result:0x007fc7698a3b48>
```

#### Extra methods the result of this endpoint:
- `#contract` downloads the contract and returns a `StringIO` or `nil`

## Using a proxy
If you are running into SSL issue while making `https://` requests you are
advised to set `verify_ssl = false`. Just don't do this in production unless
you really need it e.g. to use a proxy, as this opens up a potential attack
vector in your software.

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
