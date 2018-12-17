class StudentsController < ApplicationController
    def index
        @students = Student.where(teacher_id: current_teacher.id)  
        @programme = Student.first.programme_id
        #@industry = Company.first.industry

    end
    
    def new 
    end
     
    def edit
    end

    def show
        @student = Student.find(params[:id])
    end

    def update
        @student = current_student
    
        if @student.update_attributes(student_params)
              respond_to do |format|
                if @student.save
                      format.html { redirect_to '/my_profile/success' }
                    else
                      format.html { redirect_to '/my_profile/error' }
                  end
              end
          end 
    end

private
    def student_params
        params.require(:student).permit(:name, :education, :work_experience)
    end


end
