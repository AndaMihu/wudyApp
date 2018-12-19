class AddCompanyUserToCompany < ActiveRecord::Migration[5.2]
  def change
    add_reference :companies, :company_user, foreign_key: true
  end
end
