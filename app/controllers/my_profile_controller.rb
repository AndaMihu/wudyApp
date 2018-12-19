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
        @programmes = Programme.all
        @student = current_student
    
        if @student.update(student_params)
                      redirect_to my_profile_path(@student), alert: "Your profile is saved!" 
                else
                     render 'edit', alert: "Oops! There was a problem, please try again"
                  end
              end

  
private
    def student_params
        params.require(:student).permit(:name, :email, :mobile_phone, :education, :work_experience, :volunteer_experience, :hard_skills, :soft_skills, :interests, :avatar)
    end

end
