class AcceptanceController < ApplicationController
    def index
        if student_signed_in?
            #for the teacher
            @contract = Contract.where(student_id: current_student.id).pluck(:id).first

            @contract_status = ContractTeacherAccept.where(contract_id: @contract).pluck(:accept).first

            #for the company 

            @contractCompany = Contract.where(student_id: current_student.id).pluck(:id).first

            @contract_status_company = ContractCompanyUserAccept.where(contract_id: @contract).pluck(:accept).first

        elsif teacher_signed_in?
            @contract_status_teacher = ContractTeacherAccept.where(contract_id: params[:contract_id]).pluck(:accept).first

            @contract_id = ContractTeacherAccept.where(contract_id: params[:contract_id]).pluck(:contract_id).first

            #@teacher = ContractTeacherAccept.where(teacher_id: current_teacher.id).pluck(:accept).first

            @con = Contract.where(teacher_id: current_teacher.id).pluck(:id).first
        
            @company_user = ContractCompanyUserAccept.where(contract_id: params[:contract_id]).pluck(:accept).first

        else company_user_signed_in?

            @contract_status_user = ContractCompanyUserAccept.where(contract_id: params[:contract_id]).pluck(:accept).first

            @contract_id = ContractCompanyUserAccept.where(contract_id: params[:contract_id]).pluck(:contract_id).first

            @com = Company.where(company_user: current_company_user.id).pluck(:id)

            @com_user = ContractCompanyUserAccept.where(company_id: @com).pluck(:accept).first

            @con = ContractCompanyUserAccept.where(company_id: @com).pluck(:contract_id).first

            @teacher_user = ContractTeacherAccept.where(contract_id: params[:contract_id]).pluck(:accept).first
            

        end
        
    end
    def success
    end 

    def update_bool


    if teacher_signed_in?
        @accept2 = ContractTeacherAccept.where(teacher_id: current_teacher.id).pluck(:contract_id)

        @accept = ContractTeacherAccept.where(teacher_id: current_teacher.id)
        
        if @accept.update(accept: true)
        redirect_to acceptance_success_path
        end

    elsif company_user_signed_in?
        @com = Company.where(company_user: current_company_user.id).pluck(:id).first

        #@accept = ContractCompanyUserAccept.where(compan: current_teacher.id).pluck(:contract_id)


        @accept = ContractCompanyUserAccept.where(company_id: @com)
        if @accept.update(accept: true)
        redirect_to acceptance_success_path
        end
    end

    end

end
