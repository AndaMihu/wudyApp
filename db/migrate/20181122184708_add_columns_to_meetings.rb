class AddColumnsToMeetings < ActiveRecord::Migration[5.2]
  def change
    add_column :meetings, :title, :string
    add_column :meetings, :description, :string
    add_column :meetings, :meeting_date, :date
  end
end
