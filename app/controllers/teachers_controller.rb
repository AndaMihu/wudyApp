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
        if @teacher.update(teacher_params)
            redirect_to teacher_path(@teacher)
        else
            render 'edit', alert: "Oops! There was a problem, please try again"
        end
    end

    private
    def teacher_params
        params.require(:teacher).permit(:name, :specialization, :avatar)
    end

end
