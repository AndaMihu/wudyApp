class RemoveCompanyUserFromContract < ActiveRecord::Migration[5.2]
  def change
    remove_reference :contracts, :company_user, foreign_key: true
  end
end
