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

  # Development Database
  s.add_development_dependency "sqlite3"
  
  # Development Server
  s.add_development_dependency "thin"
  
  # Documentation
  s.add_development_dependency "yard"
  
  # # Tests
  # s.add_development_dependency "rspec-rails"
  # s.add_development_dependency "capybara"
  # s.add_development_dependency "guard-rspec"
  # s.add_development_dependency "guard-spork"
end
