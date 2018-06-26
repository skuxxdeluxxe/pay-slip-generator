# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'pay_slip_generator/version'

Gem::Specification.new do |spec|
  spec.name          = 'pay-slip-generator'
  spec.version       = PaySlipGenerator::VERSION
  spec.authors       = 'Shantanu Padhye'
  spec.email         = 'shantanu.padhye19@gmail.com'

  spec.summary       = 'Generator Pay Slips'
  spec.description   = 'Generator Pay Slips'
  spec.homepage      = 'https://github.com/skuxxdeluxxe/pay-slip-generator'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = spec.files.grep(%r{^bin\/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'activesupport', '~> 4.2'

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop', '0.50.0' # The latest version that still supports Ruby 2.0
  spec.add_development_dependency 'rainbow', '2.2.2' # A dependency of rubocop, newer versions require Ruby 2.1
end