require_relative 'lib/easy_rest_client/version'

Gem::Specification.new do |spec|
  spec.name = 'easy-rest-client'
  spec.version = EasyRestClient::VERSION
  spec.authors = ['Jerome Dalbert']
  spec.email = ['jerome.dalbert@gmail.com']

  spec.summary = 'Easily consume rest-client responses by using the dot notation.'
  spec.description = <<~EOS
    Wraps rest-client JSON responses so you can easily do response.a.b.c
    instead of response['a']['b']['c'].
  EOS
  spec.homepage = 'https://github.com/jeromedalbert/easy-rest-client'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.0.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/jeromedalbert/easy-rest-client'

  gemspec = File.basename(__FILE__)
  spec.files =
    IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
      ls
        .readlines("\x0", chomp: true)
        .reject do |f|
          (f == gemspec) ||
            f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
        end
    end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'hashie'
  spec.add_dependency 'rest-client'
end
