class ApplicationController < ActionController::Base
    def index 
    end

    def after_sign_in_path_for(resource)
        # check for the class of the object to determine what type it is
        case resource
        when Student
            student_dashboard_path
        when Teacher
            students_path
        when CompanyUser
            if current_company_user.company.nil?
            new_company_path
            else
            company_path(current_company_user.company)
            end   
        end
      end
end
