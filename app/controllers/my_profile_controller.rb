class MyProfileController < ApplicationController
    def error
    end
  
    def success
    end
    
    def index
        @student = current_student.profile_picture
    end
    
    def new 
            
    end
     
    def edit
        @student = current_student
        @programmes = Programme.all
    end

    def update
        @student = current_student
        @programmes = Programme.all
        if @student.update(student_params)
            redirect_to my_profile_index_path
        else
            render 'edit'
        end
    end         

  
private
    def student_params
        params.require(:student).permit(:name, :email, :mobile_phone, :education, :programme_id, :work_experience, :volunteer_experience, :hard_skills, :soft_skills, :interests, :avatar)
    end

end
