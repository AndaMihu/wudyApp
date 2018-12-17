class CompaniesController < ApplicationController
    
    def index
        @companies = Company.all 

        @industry = Company.industry.pluck(:name)

        @positions = Position.where(id: 3)
    end 

    def show
        @company = Company.find(params[:id])
    end 
end
