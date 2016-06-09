# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'image_compressor_pack/version'

Gem::Specification.new do |spec|
  spec.name          = "image_compressor_pack"
  spec.version       = ImageCompressorPack::VERSION
  spec.authors       = ["Petko Bordjukov"]
  spec.email         = ["bordjukov@gmail.com"]
  spec.cert_chain    = ['certs/ignisf.pem']
  spec.signing_key   = File.expand_path("~/.ssh/gem-private_key.pem") if $0 =~ /gem\z/

  spec.summary       = %q{A distribution of image optimization utilities.}
  spec.description   = %q{This gem packs a bunch of useful utilities for image optimization for use with image_optim.}
  spec.homepage      = "https://github.com/ignisf/image_compressor_pack"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.files        += `git ls-files -o -z ports/archives`.split("\x0")
  spec.require_paths = ["lib"]
  spec.extensions    = ["ext/image_compressor_pack/extconf.rb"]

  spec.add_runtime_dependency "mini_portile2", "~> 2.0"

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
end
