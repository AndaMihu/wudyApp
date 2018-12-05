class RemoveContractFromCompany < ActiveRecord::Migration[5.2]
  def change
    remove_reference :companies, :contract, foreign_key: true
  end
end
