class StudentDashboardController < ApplicationController
    def index
        if current_student.company_id.nil? 
            return redirect_to my_profile_index_path
           else
            return redirect_to student_dashboard_path
           end   
    end


end
