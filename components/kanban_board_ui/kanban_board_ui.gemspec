$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "kanban_board_ui/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "kanban_board_ui"
  s.version     = KanbanBoardUi::VERSION
  s.authors     = ["Stephan Griessner"]
  s.email       = ["sgriessner.mmt-b2012@fh-salzburg.ac.at"]
  s.homepage    = "http://www.fh-salzburg.ac.at"
  s.summary     = "KanbanBoardUi."
  s.description = "KanbanBoardUi."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5.2"
  s.add_dependency "kanban_board"
  s.add_dependency "kanban_authorization"
  s.add_dependency "decorators", "~> 2.0.1"

  s.add_development_dependency "sqlite3"
end
