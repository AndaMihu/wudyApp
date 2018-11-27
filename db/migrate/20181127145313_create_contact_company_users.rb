class CreateContactCompanyUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_company_users do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.string :job
      t.references :company, foreign_key: true
      t.references :contract, foreign_key: true

      t.timestamps
    end
  end
end
