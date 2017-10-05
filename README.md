# Easy REST Client

Easy REST Client is a tiny wrapper around the popular
[rest-client](https://github.com/rest-client/rest-client)
gem.

It just wraps JSON responses so that you can easily do `response.a.b.c` instead of `response['a']['b']['c']`.

Useful when you want to quickly consume APIs that do not provide dedicated libraries, but still want the comfort of the object dot notation.

## Installation

    gem install easy-rest-client

## Usage

```ruby
response = EasyRestClient.get 'http://some-api.com/coconuts/1'
response.weight_in_pounds #=> 3.2
```

## Contributing

Bug reports and pull requests are welcome.
