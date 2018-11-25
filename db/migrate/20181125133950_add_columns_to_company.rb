class AddColumnsToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :cvr, :integer
    add_column :companies, :company_address, :string
    add_column :companies, :zip_code, :integer
    add_column :companies, :country, :string
    add_column :companies, :internship_address, :string
  end
end
