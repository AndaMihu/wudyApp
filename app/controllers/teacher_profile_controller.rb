class TeacherProfileController < ApplicationController
    def index
        #@teacher = current_teacher.profile_picture
    end
    
    def new 
            
    end
     
    def edit
        @teacher = current_teacher
    end

    def update
        @teacher = current_teacher
    
        if @teacher.update_attributes(student_params)
                if @teacher.save
                      redirect_to '/teacher_profile' 
                    else
                     redirect_to '/teacher_profile/error' 
                  end
              end
          end 

  

private
    def student_params
        params.require(:teacher).permit(:name, :email, :specialization, :avatar)
    end

end
