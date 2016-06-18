require 'test_helper'

module KanbanBoardUi
  class ProjectsControllerTest < ActionController::TestCase
    setup do
      @routes = Engine.routes
      #@user = User.create(email: 'sgriessner@fh-salzburg.ac.at', password: '12345678', first_name: 'Stephan', last_name: 'Griessner')
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    test "should get index" do
      get :index
      assert_response :success
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should get create" do
      get :create
      assert_response :success
    end

    test "should get update" do
      get :update
      assert_response :success
    end

    test "should get show" do
      get :show
      assert_response :success
    end

    test "should get destroy" do
      get :destroy
      assert_response :success
    end
  end
end
