class StudentsController < ApplicationController
    def index
        @students = Student.where(teacher_id: current_teacher.id)  
        @programme = StudentProgramme.all
        @company = Contract.all 
    end
    
    def new 
    end
     
    def edit
    end

    def show
        @student = Student.find(params[:id])
        @event = Event.where(student_id: @student).first
    end

    def update
        @student = current_student
        @student.update(student_params)
             
           
    end

private
    def student_params
        params.require(:student).permit(:name, :email, :mobile_phone, :education, :work_experience, :volunteer_experience, :hard_skills, :soft_skills, :interests, :avatar)
  
    end


end
