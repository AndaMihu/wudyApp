class CreateProjectTimelines < ActiveRecord::Migration[5.2]
  def change
    create_table :project_timelines do |t|
      t.string :name
      t.string :description
      t.date :start_date
      t.date :end_date
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
