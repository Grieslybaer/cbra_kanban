require_dependency "kanban_board_ui/application_controller"

module KanbanBoardUi
  class MembersController < ApplicationController
    before_action :set_project
    before_action :set_member, only: [:show, :edit, :update, :destroy]
    def index
      @members = @project.members.all
    end

    def show
    end

    def new
      @project_user_ids = @project.users.pluck(:id)
      @users = KanbanBoard.user_class.all
      @member = @project.members.new
    end

    def edit
    end

    def create
      @member = @project.members.new(member_params)

      respond_to do |format|
        if @member.save
          format.html { redirect_to project_path(@project), notice: 'Member was successfully created.' }
          format.json { render action: 'show', status: :created, location: @member }
        else
          format.html { render action: 'new' }
          format.json { render json: @member.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @member.update(member_params)
          format.html { redirect_to project_path(@project), notice: 'Member was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @member.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @member.destroy
      respond_to do |format|
        format.html { redirect_to project_members_url }
        format.json { head :no_content }
      end
    end

    private

    def member_params
      params.require(:member).permit(:user_id, :user_role)
    end

    def set_member
      @member = @project.members.find(params[:id])
    end

    def set_project
      @project = KanbanBoard::Project.includes(:members).find(params[:project_id])
    end
  end
end
