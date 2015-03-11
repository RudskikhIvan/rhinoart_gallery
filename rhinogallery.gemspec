$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "rhinogallery/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "rhinogallery"
  s.version     = Rhinogallery::VERSION
  s.authors     = ["Rudskikh Ivan"]
  s.email       = ["shredder-rull@yandex.ru"]
  s.homepage    = "https://github.com/shredder-rull/rhinogallery"
  s.summary     = "Gallery for Rhinoart CMS"
  s.description = "Gallery for Rhinoart CMS"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 4.2.0"
  s.add_dependency "mini_magick"
  s.add_dependency "haml-rails"
  s.add_dependency "carrierwave"
  s.add_dependency "bootstrap-sass"
  s.add_dependency "jquery-rails"
  s.add_dependency "plupload-rails"
  s.add_dependency "jquery-ui-rails"
  s.add_dependency "lodash-rails"
  s.add_dependency "coffee-rails"
  s.add_dependency "friendly_id", "~> 5.0.0"
  s.add_dependency "acts_as_list"
  s.add_dependency "paper_trail"

  s.add_development_dependency "sqlite3"
end
