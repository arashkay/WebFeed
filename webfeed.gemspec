$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "webfeed/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "webfeed"
  s.version     = Webfeed::VERSION
  s.authors     = ["Arash Karimzadeh"]
  s.email       = ["arash@tectual.com.au"]
  s.homepage    = "https://github.com/tectual/WebFeed"
  s.summary     = "Read feeds and republish from your website"
  s.description = "Read feeds from all around the world and publish them within your website"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.8"
  s.add_dependency "nokogiri"
  s.add_dependency "paperclip", "~> 2.7"

  s.add_development_dependency "mysql2"
  s.add_development_dependency "rspec-rails"
  s.add_development_dependency "capybara"
  s.add_development_dependency "guard-rspec"
  s.add_development_dependency "guard-spork"
  s.add_development_dependency "rb-inotify", '~> 0.8.8'

end
