class ApplicationController < ActionController::Base
    def index 
    end

    def after_sign_in_path_for(resource)
        # check for the class of the object to determine what type it is
        case resource
        when Student
            student_dashboard_path
        when Teacher
            if current_teacher.specialization.nil?
            teacher_path(current_teacher)
            else
            students_path
            end
        when CompanyUser
            if current_company_user.company.nil?
            new_company_path
            else
            company_path(current_company_user.company)
            end   
        end
      end
end
