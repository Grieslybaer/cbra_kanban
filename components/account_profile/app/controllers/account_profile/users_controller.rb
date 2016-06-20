require_dependency "account_profile/application_controller"

module AccountProfile
  class UsersController < ApplicationController
    before_filter :authenticate_user!
    authorize_resource class: Account::User
    before_action :set_user, only: [:edit, :update]

    # GET /users
    def index
      @users = Account::User.all
    end

    # GET /users/1
    def show
      @user = Account::User.find(params[:id])
    end

    # GET /users/1/edit
    def edit
    end

    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params[:user].permit(
        :first_name,
        :last_name
      )
    end
  end
end
