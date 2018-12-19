class MyProfileController < ApplicationController

    def index
        @student = current_student.profile_picture
    end
    
    def new 
            
    end
     
    def edit
        @student = current_student
    end

    def update
        @student = current_student
    
        if @student.update_attributes(student_params)
                if @student.save
                      redirect_to my_profile_path(@student), alert: "Your resume is saved!" 
                else
                     render 'edit', alert: "Oops! There was a problem, please try again"
                  end
              end
          end 

  

private
    def student_params
        params.require(:student).permit(:name, :email, :mobile_phone, :education, :work_experience, :volunteer_experience, :hard_skills, :soft_skills, :interests, :avatar, :cv)
    end

end
