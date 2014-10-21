# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "devise_password_expirable/version"

Gem::Specification.new do |s|
  s.name        = "devise_password_expirable"
  s.version     = DevisePasswordExpirable::VERSION.dup
  s.authors     = ["Jenni Kissinger"]
  s.email       = ["jkissinger@carekinesis.com"]
  s.homepage    = "https://github.com/jenjaina/devise_password_expirable"
  s.licenses    = ["MIT"]
  s.summary     = %q{Expire passwords plugin for devise}
  s.description = "An extension to devise that will expire user passwords after a set amount of time and prompt them to update their password."

  s.rubyforge_project = "devise_password_expirable"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'rails', '3.0.20'
  s.add_runtime_dependency 'devise', '1.1.3'

  s.add_development_dependency 'bundler'
end
