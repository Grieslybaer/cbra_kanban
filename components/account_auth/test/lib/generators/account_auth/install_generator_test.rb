require 'test_helper'
require 'generators/account_auth/install_generator'

module AccountAuth
  module Generators
    class InstallGeneratorTest < Rails::Generators::TestCase
      tests InstallGenerator
      destination Rails.root.join('tmp/generators')
      setup :prepare_destination

      # test "generator runs without errors" do
      #   assert_nothing_raised do
      #     run_generator ["arguments"]
      #   end
      # end
    end
  end
end
