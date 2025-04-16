# frozen_string_literal: true

Gem::Specification.new do |s|
  s.name        = 'voxpupuli-rubocop'
  s.version     = '3.1.0'
  s.authors     = ['Vox Pupuli']
  s.email       = ['voxpupuli@groups.io']
  s.homepage    = 'https://github.com/voxpupuli/voxpupuli-rubocop'
  s.summary     = 'Helper Gem that pulls in all the RuboCop related gems and provides a RuboCop configuration'
  s.description = 'Used in Vox Pupuli gems to configure RuboCop in a unified and centralised way'
  s.licenses    = 'Apache-2.0'
  s.files       = Dir['lib/**/*.rb'] + ['rubocop.yml']

  s.required_ruby_version = '>= 3.1.0'

  s.add_dependency 'rake', '~> 13.0', '>= 13.0.6'
  s.add_dependency 'rubocop', '~> 1.75.2'
  s.add_dependency 'rubocop-minitest', '~> 0.38.0'
  s.add_dependency 'rubocop-performance', '~> 1.25.0'
  s.add_dependency 'rubocop-rake', '~> 0.7.1'
  s.add_dependency 'rubocop-rspec', '~> 3.5.0'
end
