class ContractsController < ApplicationController
  before_action :set_contract, only: [:show, :edit, :update, :destroy]

  # GET /contracts
  # GET /contracts.json
  def index
   @contracts = Contract.all
   @contract_student = Contract.where(student_id: params[:student_id]).first

  end

  # GET /contracts/1
  # GET /contracts/1.json
  def show
    @contract_student = Contract.where(student_id: params[:student_id]).first
  end

  # GET /contracts/new
  def new
    @current_contract = Contract.find_by(student_id: current_student.id)
  
    @programmes = Programme.all

    @contract = Contract.new

    @company = Company.all
    
    @accept = ContractTeacherAccept.new

    @acceptC = ContractCompanyUserAccept.new


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
    @company = Company.all

    @internship_type = InternshipType.all

    @accept = ContractTeacherAccept.new(accept_params)

    @acceptC = ContractCompanyUserAccept.new(acceptC_params)

    @contract = Contract.new(contract_params)

    respond_to do |format|
      if @contract.save
     
      @contact_company_user = ContactCompanyUser.new(contact_company_user_params)
      @contact_company_user.contract_id = @contract.id 
      @contact_company_user.save

      @internship_agreement = InternshipAgreement.new(agreement_params)
      @internship_agreement.contract_id = @contract.id
      @internship_agreement.save

      @accept = ContractTeacherAccept.new(accept_params)
      @accept.contract_id = @contract.id
      @accept.save

      @acceptC = ContractCompanyUserAccept.new(acceptC_params)
      @acceptC.contract_id = @contract.id
      @acceptC.company_id = @contract.company_id
      @acceptC.save

      
      format.html { redirect_to student_contracts_path(current_student), notice: 'Contract was successfully updated.' } 
      else
        format.html { redirect_to redirect to new_contract_path }
        
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

    def student_params
      params.require(:student).permit(:name, :email, :mobile_phone)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contract_params
      params.require(:contract).permit(:teacher_id, :student_id, :company_user_id, :internship_type_id, :company_id)
    end

  ##  def company_params    
   ##   params.require(:company).permit(:name, :cvr, :industry_id, :employees_number, :company_address, :zip_code, :city, :country, :website, :internship_address)
  ##  end 


    def contact_company_user_params
      params.require(:contact_company_user).permit(:contract_id, :name, :job, :email, :phone)
    end 

    def agreement_params
      params.require(:internship_agreement).permit(:contract_id, :start_date, :end_date, :weekly_working_hours, :work_tasks, :learning_goals, :other_comments)
    end 

    def accept_params
      params.require(:contract_teacher_accepts).permit(:contract_id,:teacher_id)
    end


    def acceptC_params
      params.require(:contract_teacher_accepts).permit(:contract_id,:company_id)
    end

end
