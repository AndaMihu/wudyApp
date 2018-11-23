class CreateCompanyPositions < ActiveRecord::Migration[5.2]
  def change
    create_table :company_positions do |t|
      t.references :company, foreign_key: true
      t.references :position, foreign_key: true

      t.timestamps
    end
  end
end
