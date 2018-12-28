class CompaniesController < ApplicationController
    
    def index

        @companies = Company.all 


        @industry = Company.first.industry

        #positions 
        if company_user_signed_in?
        @company.company_user_id= current_company_user.id
        @company_id = Company.where(company_user_id: current_company_user.id)
        @position = Position.where(company_id: @company_id)
        end

    end 

    def new
        @company = Company.new
        @position = Position.new
        @industry = Industry.all
    end

    def create
    @industry = Industry.all
    @company = Company.new(company_params)
    @position = Position.new(position_params)
    @company.company_user_id= current_company_user.id


    if @company.save
        @position = Position.new(position_params)
        @position.company_id = @company.id
        @position.save
        

        redirect_to company_path(@company), notice: 'Company was successfully created.' 
      else
        render 'edit', alert: "Oops! There was a problem, please try again"
    end

    end


    def edit
        @company = Company.find(params[:id])

        @industry = Industry.all

    end

    def update
        @industry = Industry.all
        @company.update(company_params)

    end 

    def show
        @company = Company.find(params[:id])
        @position = Position.where(company_id: @company).pluck(:name).first

        @allInterns = Contract.where(company_id: params[:id]).count

        if company_user_signed_in?
        @company_id = Company.where(company_user_id: current_company_user.id)
        @position = Position.where(company_id: @company_id).pluck(:name).first
        end 
    end 

    private

    def company_params    
        params.require(:company).permit(:name, :company_address, :country, :cvr, :company_description, :employees_number, :website, :city, :zip_code, :internship_description, :available_spots, :industry_id, :company_user_id)
    end 

    def position_params
        params.require(:position).permit(:name)
    end

end
