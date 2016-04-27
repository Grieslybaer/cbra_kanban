require_dependency "kanban_user_profile/application_controller"

module KanbanUserProfile
  class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    # GET /users
    def index
      @users = KanbanUser::User.all
    end

    # GET /users/1
    def show
    end

    # GET /users/new
    def new
      @user = KanbanUser::User.new
    end

    # GET /users/1/edit
    def edit
    end

    # POST /users
    def create
      @user = KanbanUser::User.new(user_params)

      if @user.save
        redirect_to @user, notice: 'User was successfully created.'
      else
        render :new
      end
    end

    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        redirect_to @user, notice: 'User was successfully updated.'
      else
        render :edit
      end
    end

    # DELETE /users/1
    def destroy
      @user.destroy
      redirect_to users_url, notice: 'User was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = KanbanUser::User.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        params[:user].permit(
          :first_name,
          :last_name,
          :role
        )
      end
  end
end
