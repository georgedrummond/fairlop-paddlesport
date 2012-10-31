# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "version"

Gem::Specification.new do |s|
  s.name        = "fairlop"
  s.version     = Fairlop::VERSION
  s.authors     = ["George Drummond"]
  s.email       = ["georgedrummond@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}
  s.files         = Dir["lib/**/*"] + ["Rakefile", "README.md", "Gemfile", "Gemfile.lock", "config.ru"]
  s.test_files    = Dir["{test, spec, features}/**/*"]
  s.executables   = Dir["bin/*"].entries.map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "sinatra", "1.3.1"
  s.add_dependency "georgedrummond_sinatra_helpers"
  s.add_dependency "haml"
  s.add_dependency "sass"
  s.add_dependency "koala"
  s.add_dependency "sinatra-dalli"
end
