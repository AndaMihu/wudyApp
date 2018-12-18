class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  # GET /contracts
  # GET /contracts.json
  def index
   @contracts = Contract.all
   
  #@agreement = InternshipAgreement.includes(:internship_agreemenet).where(:internship_agreemenet => {contract_id: current_student.contratct_id}).first
  
  #@company_user = CompanyUser.includes(:company_user).where(:company_user => {contract_id: current_student.contratct_id}).first

  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    @programme = Student.first.programme
    @contact_language = Contract.first.contact_language
    @internship_type = Contract.first.internship_type
  end

  # GET /contracts/new
  def new

    #@uni_id = University.where()
    #get all programms that have the same university_id as the current_student programme
    #@pr = Programme.joins(:university).where(:university_id => {university_id: current_student.programme_id})
    #@uni = University.joins(:programmes)

    #@pr = Programme.joins(:university).where(university_id: 1)

    @current_contract = Contract.find_by(student_id: current_student.id)
   
    if @current_contract.nil?
       redirect_to new_contract_path
    else 
    redirect_to contract_path(@current_contract)

   end

    @programmes = Programme.all

    @contract = Contract.new

    @company = Company.new

    @contact_language = ContactLanguage.all

    @internship_type = InternshipType.all
  end
  
  def show
    @student = Student.find(params[:id])

  end

  # GET /contracts/1/edit
  def edit
  end

  # POST /contracts
  # POST /contracts.json
  def create

    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save

      @contact_company_user = ContactCompanyUser.new(contact_company_user_params)
      @contact_company_user.contract_id = @contract.id 
      @contact_company_user.save

      @internship_agreement = InternshipAgreement.new(agreement_params)
      @internship_agreement.contract_id = @contract.id
      @internship_agreement.save


      @company = Company.new(company_params)
      @company.contract_id = @contract.id 
      @company.save

        format.html { redirect_to @contract, notice: 'Contract was successfully created.' }
        format.json { render :show, status: :created, location: @contract }
      else
        format.html { render :new }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contracts/1
  # PATCH/PUT /contracts/1.json
  def update
    respond_to do |format|
      if @contract.update(contract_params)
        format.html { redirect_to @contract, notice: 'Contract was successfully updated.' }
        format.json { render :show, status: :ok, location: @contract }
      else
        format.html { render :edit }
        format.json { render json: @contract.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contracts/1
  # DELETE /contracts/1.json
  def destroy
    @contract.destroy
    respond_to do |format|
      format.html { redirect_to contracts_url, notice: 'Contract was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contract
      @contract = Contract.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(:teacher_id, :student_id, :company_user_id)
    end

    def company_params    
      params.require(:company).permit(:contract_id, :name, :cvr, :industry_id, :employees_number, :company_address, :zip_code, :city, :country, :website, :internship_address)
    end 


    def contact_company_user_params
      params.require(:contact_company_user).permit(:contract_id, :name, :job, :email, :phone)
    end 

    def agreement_params
      params.require(:internship_agreement).permit(:contract_id, :start_date, :end_date, :weekly_working_hours, :work_tasks, :learning_goals, :other_comments)
    end 

    
end
