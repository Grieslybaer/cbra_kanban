require_dependency "kanban_board_ui/application_controller"

module KanbanBoardUi
  class ProjectsController < ApplicationController
    before_action :set_project, only: [:edit, :update, :destroy]

    def index
      @projects = KanbanBoard::Project.all
    end

    def show
      @project = KanbanBoard::Project.includes(:assignments, :tasks, :users).find(params[:id])
      @owner = @project.users.first
      @states = KanbanBoard.states
      #@tasks = @project.tasks
    end

    def new
      @project = KanbanBoard::Project.new
    end

    def edit
    end

    def create
      @project = KanbanBoard::Project.new(project_params)
      respond_to do |format|
        if @project.save
          @project.members.create!(user: current_user, user_role: 'admin')
          format.html { redirect_to @project, notice: 'Project was successfully created.' }
          format.json { render action: 'show', status: :created, location: @project }
        else
          format.html { render action: 'new' }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @project.update(project_params)
          format.html { redirect_to @project, notice: 'Project was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @project.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @project.destroy
      respond_to do |format|
        format.html { redirect_to projects_path }
        format.json { head :no_content }
      end
    end

    private
    def set_project
      @project = KanbanBoard::Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description, :deadline)
    end
  end
end