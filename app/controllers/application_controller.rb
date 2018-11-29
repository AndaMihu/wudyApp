class ApplicationController < ActionController::Base
    def index 
    end

    def after_sign_in_path_for(student)
        student_dashboard_path
    end

    def after_sign_in_path_for(teacher)
        students_path
    end


end
