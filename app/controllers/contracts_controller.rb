class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  # GET /contracts
  # GET /contracts.json
  def index
   @contracts = Contract.all

  @contracts_all = Contract.find_by(student_id: current_student.id)
    if @contracts_all.nil?
       redirect_to new_contract_path
    else 

   end
  
  #@agreement = InternshipAgreement.includes(:internship_agreemenet).where(:internship_agreemenet => {contract_id: current_student.contratct_id}).first
  
  #@company_user = CompanyUser.includes(:company_user).where(:company_user => {contract_id: current_student.contratct_id}).first

  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
  end

  # GET /contracts/new
  def new
    @contract = Contract.new
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

      @contact_company_user = ContactCompanyUser.new(company_user_params)
      @contact_company_user.contract_id = @contract.id 
      @contact_company_user.save

      @internship_agreement = InternshipAgreement.new(agreement_params)
      @internship_agreement.contract_id = @contract.id
      @internship_agreement.save

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

    def company_user_params
      params.require(:contact_company_user).permit(:job, :contract_id)
    end 

    def agreement_params
      params.require(:internship_agreement).permit(:contract_id, :learning_goals)
    end 

end
