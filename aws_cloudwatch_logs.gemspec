
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aws_cloudwatch_logs/version'

Gem::Specification.new do |spec|
  spec.name          = 'aws_cloudwatch_logs'
  spec.version       = AwsCloudwatchLogs::VERSION
  spec.authors       = ['MATSUMOTO Eiji']
  spec.email         = ['e.mattsan@gmail.com']

  spec.summary       = 'querying event form AWS CloudWatch Logs'
  spec.description   = 'querying event form AWS CloudWatch Logs'
  spec.homepage      = 'https://github.com/mattsan/aws_cloudwatch_logs'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://github.com/mattsan/aws_cloudwatch_logs'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) {|f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'aws-sdk', '~> 3'

  spec.add_development_dependency 'bundler', '~> 1.16.a'
  spec.add_development_dependency 'rake', '~> 10.0'
end
