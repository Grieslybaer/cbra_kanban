require_dependency "kanban_board_ui/application_controller"

module KanbanBoardUi
  class TasksController < ApplicationController
    before_action :set_project
    before_action :set_task, only: [:show, :edit, :update, :destroy]
    def index
      @tasks = @project.tasks.all
    end

    def show
    end

    def new
      @task = @project.tasks.new
    end

    def edit
    end

    def create
      @task = @project.tasks.new(task_params)

      respond_to do |format|
        if @task.save
          format.html { redirect_to project_path(@project), notice: 'Task was successfully created.' }
          format.json { render action: 'show', status: :created, location: @task }
        else
          format.html { render action: 'new' }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @task.update(task_params)
          format.html { redirect_to project_path(@project), notice: 'Task was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @task.errors, status: :unprocessable_entity }
        end
      end
    end

    def destroy
      @task.destroy
      respond_to do |format|
        format.html { redirect_to project_tasks_url }
        format.json { head :no_content }
      end
    end

    private

    def task_params
      params.require(:task).permit(:name, :description, :finishing_date, :priority)
    end

    def set_task
      @task = @project.tasks.find(params[:id])
    end

    def set_project
      @project = KanbanBoard::Project.find(params[:project_id])
    end
  end
end