class CompaniesController < ApplicationController
    
    def index

        @companies = Company.all 

        @industry = Company.first.industry

        @position = CompanyPosition.all

        #@industry = Industry.includes(:company).where(id: industry_id).pluck(:name)

        #@positions = Company.first.position

        #@interns = Company.first.students.ids

    end 

    def new
        @company = Company.new
        @industry = Industry.all
    end

    def create

    @company = Company.new(company_params)
    @company.company_user_id= current_company_user.id

    if @company.save
        redirect_to company_path(@company), notice: 'Company was successfully created.' 
      else
        render 'edit', alert: "Oops! There was a problem, please try again"
    end

    end


    def edit
        @industry = Industry.all

    end

    def update
        @industry = Industry.all
        @company.update(company_params)

    end 

    def show
        @company = Company.find(params[:id])

        @allInterns = Contract.where(company_id: params[:id]).count
    end 

    private

    def company_params    
        params.require(:company).permit(:name, :company_address, :country, :cvr, :company_description, :employees_number, :website, :city, :internship_description, :available_spots, :industry_id, :company_user_id)
    end 

end
