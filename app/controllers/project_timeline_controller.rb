class ProjectTimelineController < ApplicationController
    def index 
        @task = Task.all
    end

    def new
        @task = Task.new

    end

    def show
        #@project_timeline = ProjectTimeline.find(params[:id])
    end 

    def create 

    #@project_timeline = ProjectTimeline.new
    #@project_timeline.company_id = @company.id
    #@project_timeline.save

        @task = Task.new(task_params)
        @task.save
    end

    private 
    def task_params
        params.require(:task).permit(:name, :description, :start_date, :end_date, :project_timeline_id)
    end
end
