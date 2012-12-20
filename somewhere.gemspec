# -*- encoding: utf-8 -*-
require File.expand_path("../lib/somewhere/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = "somewhere"
  s.version     = Somewhere::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = "Jonathan Martin"
  s.email       = "me@nybblr.com"
  s.homepage    = "http://rubygems.org/gems/somewhere"
  s.summary     = "Addresses are common. Really common. So why do we settle for 5+ unserialized address attribute fields and custom to_s methods for each model? No more. This gem is simple and to the point: serialize address data to a class, provide some syntactically useful conversion methods, done. Heavily based off my money gem Cratchit."
  s.description = "Serialized address class for use with Rails models."

  s.required_rubygems_version = ">= 1.3.6"
  s.rubyforge_project         = "somewhere"

  s.add_development_dependency "bundler", ">= 1.0.0"

  s.files        = `git ls-files`.split("\n")
  s.executables  = `git ls-files`.split("\n").map{|f| f =~ /^bin\/(.*)/ ? $1 : nil}.compact
  s.require_path = 'lib'
end
