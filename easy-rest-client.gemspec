lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name = 'easy-rest-client'
  spec.version = '0.1.0'
  spec.authors = ['Jerome Dalbert']
  spec.email = ['jerome.dalbert@gmail.com']

  spec.summary = 'Easily consume rest-client responses by using the dot notation.'
  spec.summary = <<~EOS
    It just wraps JSON responses so that you can easily do `response.a.b.c`
    instead of `response['a']['b']['c']`.
  EOS
  spec.homepage = 'https://github.com/jeromedalbert/easy-rest-client'
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f =~ %r{^spec/} }
  spec.require_paths = ['lib']

  spec.add_dependency 'rest-client', '~> 2.0'
  spec.add_dependency 'hashie'

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'awesome_print'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency 'fuubar'
  spec.add_development_dependency 'webmock'
  spec.add_development_dependency 'rubocop', '~> 0.50.0'
end
