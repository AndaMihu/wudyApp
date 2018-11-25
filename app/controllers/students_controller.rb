class StudentsController < ApplicationController
    def index
    end
    
    def new 
    end
     
    def edit
    end

    def show
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
