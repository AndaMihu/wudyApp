class CreateInternshipAgreements < ActiveRecord::Migration[5.2]
  def change
    create_table :internship_agreements do |t|
      t.date :start_date
      t.date :end_date
      t.integer :weekly_working_hours
      t.string :work_tasks
      t.string :learning_goals
      t.string :other_comments
      t.references :contract, foreign_key: true

      t.timestamps
    end
  end
end
