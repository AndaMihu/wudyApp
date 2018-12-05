class RemoveContracFromCompanyUser < ActiveRecord::Migration[5.2]
  def change
    remove_reference :company_users, :contract, foreign_key: true
  end
end
