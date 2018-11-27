class AddContractIdToCompanyUser < ActiveRecord::Migration[5.2]
  def change
    add_reference :company_users, :contract, foreign_key: true
  end
end
