require_dependency "kanban_user_profile/application_controller"

module KanbanUserProfile
  class UsersController < ApplicationController
    before_filter :authenticate_user!
    authorize_resource class: KanbanUser::User
    before_action :set_user, only: [:edit, :update]

    # GET /users
    def index
      @users = KanbanUser::User.all
    end

    # GET /users/1
    def show
      @user = KanbanUser::User.find(params[:id])
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
      if current_user.id.to_s == params[:id]
        @user = current_user
      else
        @user = KanbanUser::User.find(params[:id])
        redirect_to user_path, notice: "You can not edit another user!"
      end
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
