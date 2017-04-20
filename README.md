# Bigbank Ruby Client
[![CircleCI](https://circleci.com/gh/MrTin/bigbank-client.svg?style=svg)](https://circleci.com/gh/MrTin/bigbank-client)

## Installation
Add it to your Gemfile:

```ruby
gem 'bigbank-client'
```

Configure the client
```ruby
Bigbank::Client.configure do |config|
  config.endpoint = "https://ansok.bigbank.se/api/"
  config.partner_key = "super-secret-partner-key"
end

# Available endpoints:
# - Estonia: https://www.bigbank.ee/api/
# - Latvia: https://www.bigbank.lv/api/
# - Lithuania: https://www.bigbank.lt/api/
# - Finland: https://www.bigbank.fi/api/
# - Sweden: https://www.bigbank.se/api/
# - Spain: https://www.bigbank.es/api/
```

## Bigbank requirements
- Register partner IP in their system to allow requests.
- Request a partner key.

## Usage
TODO: Write usage instructions here

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mrtin/bigbank-client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
