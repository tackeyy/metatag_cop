# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'metatag_cop/version'

Gem::Specification.new do |spec|
  spec.name          = 'metatag_cop'
  spec.version       = MetatagCop::VERSION
  spec.authors       = ['tackeyy']
  spec.email         = ['mailto.takita.yusuke@gmail.com']

  spec.summary       = 'metatag_cop loads csv file and checks whether meta tags is set proper value.'
  spec.description   = 'metatag_cop loads csv file and checks whether meta tags is set proper value.'
  spec.homepage      = 'https://github.com/tackeyy/metatag_cop'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'bin'
  spec.executables   = ['metatag_cop']
  spec.require_paths = ['lib']

  spec.add_dependency 'nokogiri', '~> 1.7'
  spec.add_dependency 'formatador', '~> 0.2.5'
  spec.add_dependency 'kosi', '~> 1.0'

  spec.add_development_dependency 'bundler', '~> 1.14'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
