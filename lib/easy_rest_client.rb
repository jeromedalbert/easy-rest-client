require 'rest-client'
require 'json'
require 'hashie'

class EasyRestClient

  class << self
    def get(*args);     new.send_request(:get,     *args); end
    def post(*args);    new.send_request(:post,    *args); end
    def put(*args);     new.send_request(:put,     *args); end
    def delete(*args);  new.send_request(:delete,  *args); end
    def execute(*args); new.send_request(:execute, *args); end
  end

  def send_request(method_name, *args)
    klass = method_name == :execute ? ::RestClient::Request : ::RestClient

    response = klass.send(method_name, *args)

    parse(response)
  end

  private

  def parse(response)
    if response.headers[:content_type] !~ %r(application/json)
      return response.body
    end

    parsed_body = JSON.parse(response.body)
    convert_to_object(parsed_body)
  end

  def convert_to_object(element)
    if element.is_a?(Hash)
      Hashie::Mash.new(element)
    elsif element.is_a?(Array)
      element.map { |sub_element| convert_to_object(sub_element) }
    else
      element
    end
  end

end
