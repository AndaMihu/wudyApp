class AddColumnsToContractCompanyUserAccepts < ActiveRecord::Migration[5.2]
  def change
    add_reference :contract_company_user_accepts, :contract, foreign_key: true
    add_reference :contract_company_user_accepts, :company, foreign_key: true
    add_column :contract_company_user_accepts, :accept, :boolean
  end
end
