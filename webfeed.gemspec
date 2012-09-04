$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "webfeed/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "webfeed"
  s.version     = Webfeed::VERSION
  s.authors     = ["Arash Karimzadeh"]
  s.email       = ["arash@tectual.com.au"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of Webfeed."
  s.description = "TODO: Description of Webfeed."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "nokogiri"

  s.add_development_dependency "mysql2"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
  s.add_development_dependency "rb-inotify", '~> 0.8.8'

end
