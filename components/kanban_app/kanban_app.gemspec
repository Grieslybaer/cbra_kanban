$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kanban_app/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kanban_app"
  s.version     = KanbanApp::VERSION
  s.authors     = ["Grie"]
  s.email       = ["sgriessner.mmt-b2012@fh-salzburg.ac.at"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of KanbanApp."
  s.description = "TODO: Description of KanbanApp."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5.2"

  s.add_development_dependency "sqlite3"
end
