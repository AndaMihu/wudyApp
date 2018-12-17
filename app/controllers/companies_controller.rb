class CompaniesController < ApplicationController
    
    def index
        @companies = Company.all 

        @industry = Company.first.industry
        #@industry = Industry.includes(:company).where(id: industry_id).pluck(:name)

        #@positions = Company.first.position.pluck(:name)

      #  @interns = Company.first.students.ids
    end 

    def show
        @company = Company.find(params[:id])
    end 
end
