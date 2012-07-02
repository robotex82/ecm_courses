$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "ecm_courses/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "ecm_courses"
  s.version     = EcmCourses::VERSION
  s.authors     = ["Roberto Vasquez Angel"]
  s.email       = ["roberto@vasquez-angel.de"]
  s.homepage    = "https://github.com/robotex82/ecm_courses"
  s.summary     = "Course management module."
  s.description = "Couse management module for active admin."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "rails", "~> 3.2.6"

  s.add_development_dependency "sqlite3"
end
