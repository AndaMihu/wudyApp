class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|
      t.boolean :is_accepted
      t.string :contact_language
      t.references :teacher, foreign_key: true
      t.references :student, foreign_key: true
      t.references :company_user, foreign_key: true

      t.timestamps
    end
  end
end
