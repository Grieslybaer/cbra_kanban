$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kanban_card/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kanban_card"
  s.version     = KanbanCard::VERSION
  s.authors     = ["Stephan Griessner"]
  s.email       = ["sgriessner.mmt-b2012@fh-salzburg.ac.at"]
  s.homepage    = "http://www.fh-salzburg.ac.at"
  s.summary     = "KanbanCard."
  s.description = "KanbanCard."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5.2"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency "minitest-rails-capybara"
end
