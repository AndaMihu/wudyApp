class StudentsController < ApplicationController
    def index
        if teacher_signed_in?
        @students = Student.where(teacher_id: current_teacher.id)  
        #@position = Contract.where(student_id: @students)

        @position = CompanyPosition.all


        elsif company_user_signed_in?
        @com = Company.where(company_user: current_company_user.id).pluck(:id).first

        @students = Student.all

        #@students = Contract.where(company_id: @com)
        end
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
        if @student.update(student_params)
            redirect_to my_profile_index_path
        else
            render 'edit'
        end 
    end

private
    def student_params
        params.require(:student).permit(:name, :email, :mobile_phone, :education, :work_experience, :volunteer_experience, :hard_skills, :soft_skills, :interests, :avatar, :good_want, :good_not, :bad_want, :bad_not)
  
    end


end
