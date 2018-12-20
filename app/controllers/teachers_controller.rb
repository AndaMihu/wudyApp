class TeachersController < ApplicationController
    def index
        @teacher = Teacher.where(id: current_student.teacher_id).first
        @uni = University.where(id: 1).first
    end

    def show

    end 

    def edit 
        @teacher = current_teacher

    end 

    def update
        @teacher = current_teacher
        @teacher.update(teacher_params)

    end

    private
    def teacher_params
        params.require(:teacher).permit(:name, :avatar)
    end

end
