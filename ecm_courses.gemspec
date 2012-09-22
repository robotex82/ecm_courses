$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ecm/courses/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_courses"
  s.version     = Ecm::Courses::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/ecm_courses"
  s.summary     = "Course management module."
  s.description = "Couse management module for active admin."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.6"
  s.add_dependency "acts_as_list", "~> 0.1.6"
  s.add_dependency "active_admin-acts_as_list", "~> 0.0.6"
  s.add_dependency "active_admin-awesome_nested_set"
  s.add_dependency "awesome_nested_set", "~> 2.1.3"
  s.add_dependency "awesome_nested_set-tools"
  s.add_dependency "ecm_calendar_helper", "~> 0.0.1.pre"
  s.add_dependency "friendly_id", "~> 4.0.7"
  s.add_dependency "rails_tools-absence_validator", "~>0.0.3"

  # Development Database
  s.add_development_dependency "sqlite3"
  
  # Development Server
  s.add_development_dependency "thin"
  
  # Documentation
  s.add_development_dependency "yard"

  # Active admin
  s.add_development_dependency 'activeadmin'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'coffee-rails'
  
  # Dummy App
  # s.add_development_dependency "activeadmin" # Using edge active admin (see Gemfile)
  s.add_development_dependency "sass-rails"
  s.add_development_dependency "meta_search", ">= 1.1.0.pre"
  
  # # Tests
  s.add_development_dependency "rspec-rails", "~> 2.0"
  s.add_development_dependency "factory_girl_rails", "~> 1.0"
  s.add_development_dependency "shoulda-matchers"
  s.add_development_dependency "capybara"
  
  # s.add_development_dependency "capybara"
  # s.add_development_dependency "guard-rspec"
  # s.add_development_dependency "guard-spork"
end
