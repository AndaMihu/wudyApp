class EventsController < ApplicationController
    before_action :set_event, only: [:show, :edit, :update, :destroy]

    def index
      @events = Event.where(teacher_id: current_teacher.id)
    end
  
    def show
      @eveStudent = Student.find(params[:id])
    end
  
    def new
      @event = Event.new
      #@event.student_id = params[:id]
      #@eveStudent = Student.find(params[:id])
      #student_id = @eveStudent 
      #@eveStudent = Student.find(params[:id])

    end
  
    def edit
    end
  
    def create
      @event = Event.new(event_params)
      @event.teacher_id = current_teacher.id
      @event.student_id = 7
      @event.save
    end
  
    def update
      @event.update(event_params)
    end
  
    def destroy
      @event.destroy
    end
  
    private
      def set_event
        #@event = Event.find(params[:id])
      end
  
      def event_params
        params.require(:event).permit(:title, :date_range, :start, :end, :color, :teacher_id, :student_id)
      end
end
