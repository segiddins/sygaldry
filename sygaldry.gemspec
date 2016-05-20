# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sygaldry/version'

Gem::Specification.new do |spec|
  spec.name          = 'sygaldry'
  spec.version       = Sygaldry::VERSION
  spec.authors       = ['Samuel Giddins']
  spec.email         = ['segiddins@segiddins.me']

  spec.summary       = 'Make dealing with CHANGELOG just like magic!'
  spec.homepage      = 'https://github.com/segiddins/Sygaldry'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`
                       .split("\x0")
                       .grep(%r{^(?!(spec|bin)/)})

  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 11.0'
end
