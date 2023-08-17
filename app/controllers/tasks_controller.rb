class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end
    def show
        @task = Task.find(params[:id])
    end
    def new
        @task = Task.new
    end
    def create
        @task = Task.new(task_params)
        @task.save
        redirect_to "/tasks"
    end
    def edit
        @task = Task.find(params[:id])
    end
    def update
        @task = Task.find(params[:id])
        @task.update(task_params) # Will raise ActiveModel::ForbiddenAttributesError
        redirect_to task_path(@task)
    end
    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        # No need for app/views/restaurants/destroy.html.erb
        redirect_to "/tasks"
    end

    private 

    def task_params
        params.require(:task).permit(:name, :details, :completed)
    end
end
