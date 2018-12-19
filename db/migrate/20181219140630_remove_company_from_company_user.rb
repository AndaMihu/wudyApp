class RemoveCompanyFromCompanyUser < ActiveRecord::Migration[5.2]
  def change
    remove_column :company_users, :company_id
  end
end
