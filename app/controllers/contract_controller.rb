class ContractController < ApplicationController
    
    def new
        @contract = Contract.new
    end
    
    def show
    end

    def create
        @contract = Contract.new(contract_params)
        
        @contract.student_id = current_student.id

        respond_to do |format|
            if @contract.save
                format.html { redirect_to '/contract/success' }
            else
                format.html { redirect_to '/contract/error' }

             end
          end
    end

    def update
        @contract = Contract.where(student_id: current_student.id)
        # @contract.student_id = current_student.id
    
        if @contract.update_attributes(contract_params)
              respond_to do |format|
                if @student.save
                      format.html { redirect_to '/contract/success' }
                    else
                      format.html { redirect_to '/contract/error' }
                  end
              end
          end 
    end

    def success
    end 

    def error
    end 

private
    def student_params
        params.require(:contract).permit(:name, :education, :work_experience)
    end

private
def contract_params
    params.required(:contract).permit(:contact_language)
end

end
