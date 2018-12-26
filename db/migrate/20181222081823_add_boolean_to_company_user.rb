class AddBooleanToCompanyUser < ActiveRecord::Migration[5.2]
  def change
    add_column :company_users, :accepted, :boolean
  end
end
