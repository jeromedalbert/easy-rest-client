# Easy Rest Client

This gem wraps rest-client JSON responses so you can easily do `response.a.b.c`
instead of `response['a']['b']['c']`.

## Installation

Install the gem globally:

```
gem install easy-rest-client
```

Or add this line to your Gemfile:

```ruby
gem 'easy-rest-client'
```

and run `bundle install`.

## Usage

```ruby
response = EasyRestClient.get 'http://some-api.com/dogs/1'
response.name #=> "Fido"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/jeromedalbert/easy-rest-client. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/jeromedalbert/easy-rest-client/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Easy::Rest::Client project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/jeromedalbert/easy-rest-client/blob/main/CODE_OF_CONDUCT.md).
