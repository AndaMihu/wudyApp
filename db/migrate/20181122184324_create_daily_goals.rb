class CreateDailyGoals < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_goals do |t|
      t.string :title
      t.date :end_date
      t.references :student, foreign_key: true

      t.timestamps
    end
  end
end
