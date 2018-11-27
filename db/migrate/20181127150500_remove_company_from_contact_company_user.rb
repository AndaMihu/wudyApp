class RemoveCompanyFromContactCompanyUser < ActiveRecord::Migration[5.2]
  def change
    remove_reference :contact_company_users, :company, foreign_key: true
  end
end
