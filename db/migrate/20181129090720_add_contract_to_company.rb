class AddContractToCompany < ActiveRecord::Migration[5.2]
  def change
    add_reference :companies, :contract, foreign_key: true
  end
end
