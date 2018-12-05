class TaskController < ApplicationController
    def index
        @tasksAll = Task.all
    end
    
    def new
        @task = Task.new

    end

    def create 
        @task = Task.new(task_params)
        @task.project_timeline_id = 1
        if @task.save
            flash[:success] = "New User created."
        else
            render 'new'

        end
            
    end

    private 
    def task_params
        params.require(:task).permit(:name, :description, :start_date, :end_date, :project_timeline_id)
      end

end
