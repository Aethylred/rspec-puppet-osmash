Gem::Specification.new do |s|
  s.name        = 'rspec_puppet_osmash'
  s.version     = '0.1.1'
  s.date        = '2015-04-30'
  s.summary     = 'Provides Operation System hashes and validations for rspec-puppet'
  s.description = 'Provides Operation System hashes and validations for rspec-puppet'
  s.authors     = ['Aaron Hicks']
  s.email       = 'aethylred@gmail.com'
  s.files       = ['lib/rspec_puppet_osmash.rb','lib/osmash.json']
  s.homepage    = 'https://github.com/Aethylred/rspec-puppet-osmash'
  s.license     = 'Apache-2.0'
  s.required_ruby_version = '>= 1.8.7'

  s.add_dependency 'json', '~> 1'
end
