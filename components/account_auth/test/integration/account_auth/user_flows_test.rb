require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
  include Capybara::DSL

  def setup
    @user = User.create(email: 'test@example.com', password: '12345678')
  end

  def teardown
    User.destroy_all
  end

  def log_in_user
    visit(account_auth.new_user_session_path)
    fill_in('Email', with: @user.email)
    fill_in('Password', with: '12345678')
    click_button('Log in')
  end

  test 'Login user' do
    log_in_user
    assert_equal root_path, current_path
  end

  test 'register new user' do
    visit(account_auth.new_user_registration_path)

    fill_in('Email', with: 'integration@user.com')
    fill_in('Password', with: '12345678')
    fill_in('Password confirmation', with: '12345678')
    click_button('Sign up')

    assert_equal root_path, current_path
  end

  test 'edit account settings' do
    log_in_user
    visit(account_auth.edit_user_registration_path)

    fill_in('Email', with: 'Tester12345@user.com')
    fill_in('Current password', with: '12345678')
    click_button('Update')
    assert_equal root_path, current_path
  end
end
