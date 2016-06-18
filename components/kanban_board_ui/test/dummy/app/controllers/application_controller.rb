class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # fake authentication for tests
  # def sign_in(user)
  # 	@user = User.find(user.id)
  # end

  # def sign_out
  # 	@user = nil
  # end

  # def current_user
  # 	@user
  # end

  # def authenticate_user!
  # 	current_user
  # end

  # helper_method :current_user
  # helper_method :sign_in
  # helper_method :sign_out
end
