require_dependency "kanban_board_ui/application_controller"

module KanbanBoardUi
  class MembersController < ApplicationController
    before_action :set_project
    before_action :set_member, only: [:update, :destroy]
    
    def index
      @project_user_ids = @project.users.pluck(:id)
      @users = KanbanBoard.user_class.all
      @members = @project.members.includes(:user)
      @member = @project.members.new
    end

    def create
      @member = @project.members.new(member_params)

      respond_to do |format|
        if @member.save
          format.html { redirect_to project_members_path(@project), notice: 'Member was successfully added.' }
          format.json { render action: 'index', status: :created, location: @member }
        else
          format.html { render action: 'index' }
          format.json { render json: @member.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @member.update(member_params)
          format.html { redirect_to project_members_path(@project), notice: 'Member was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'index' }
          format.json { render json: @member.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @member.destroy
      respond_to do |format|
        format.html { redirect_to project_members_path(@project) }
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
