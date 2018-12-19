class CompanyProfileController < ApplicationController
    if current_company_user.company_id.nil?
        redirect_to new_company_path
    end

    def index
    end

end
