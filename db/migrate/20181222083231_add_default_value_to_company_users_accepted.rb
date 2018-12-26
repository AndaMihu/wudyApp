class AddDefaultValueToCompanyUsersAccepted < ActiveRecord::Migration[5.2]
  def up
    change_column :company_users, :accepted, :boolean, default: true
  end
  
  def down
    change_column :company_users, :accepted, :boolean, default: nil
  end
end
