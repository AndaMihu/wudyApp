class CreateContractCompanyUserAccepts < ActiveRecord::Migration[5.2]
  def change
    create_table :contract_company_user_accepts do |t|

      t.timestamps
    end
  end
end
