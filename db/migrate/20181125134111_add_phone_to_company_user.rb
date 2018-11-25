class AddPhoneToCompanyUser < ActiveRecord::Migration[5.2]
  def change
    add_column :company_users, :mobile_phone, :integer
  end
end
