# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "all3dp/version"

Gem::Specification.new do |spec|
  spec.name = "all3dp"
  spec.version = All3DP::VERSION
  spec.authors = ["Sunny Ripert"]
  spec.email = ["sunny@sunfox.org"]

  spec.summary = "Access All3DP's API"
  spec.description = "Send 3D files to the All3DP API"
  spec.homepage = "http://github.com/sunny/all3dp"

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "http", "2.0.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 12.3"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.6"
  spec.add_development_dependency "rubocop", "~> 0.55"
  spec.add_development_dependency "httplog", "~> 1.0"
  spec.add_development_dependency "pry", "~> 0.11"
end
