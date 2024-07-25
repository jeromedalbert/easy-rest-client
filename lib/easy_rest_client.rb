require 'hashie'
require 'json'
require 'rest-client'
require_relative 'easy_rest_client/version'

# Wrapper to easily consume rest-client responses by using the dot notation.
#
#   response = EasyRestClient.get 'http://some-api.com/dogs/1'
#   response.name #=> "Fido"
class EasyRestClient
  def self.get(...) = new.send_request(:get, ...)
  def self.post(...) = new.send_request(:post, ...)
  def self.put(...) = new.send_request(:put, ...)
  def self.delete(...) = new.send_request(:delete, ...)
  def self.execute(...) = new.send_request(:execute, ...)

  def send_request(method_name, ...)
    klass = (method_name == :execute) ? ::RestClient::Request : ::RestClient

    response = klass.send(method_name, ...)

    parse(response)
  end

  private

  def parse(response)
    return response.body if !response.headers[:content_type].match?(%r{application/json})

    parsed_body = JSON.parse(response.body)

    convert_to_object(parsed_body)
  end

  def convert_to_object(element)
    case element
    when Hash
      Hashie::Mash.new(element)
    when Array
      element.map { |sub_element| convert_to_object(sub_element) }
    else
      element
    end
  end
end
