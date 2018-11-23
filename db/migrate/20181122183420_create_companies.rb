class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :location
      t.integer :available_spots
      t.string :company_description
      t.string :internship_description
      t.integer :employees_number
      t.string :website
      t.references :industry, foreign_key: true

      t.timestamps
    end
  end
end
