class CreateInternshipCoaches < ActiveRecord::Migration[5.2]
  def change
    create_table :internship_coaches do |t|
      t.references :student, foreign_key: true
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end
