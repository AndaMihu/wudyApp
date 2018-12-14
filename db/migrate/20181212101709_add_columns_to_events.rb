class AddColumnsToEvents < ActiveRecord::Migration[5.2]
  def change
    add_column :events, :title, :string
    add_column :events, :start, :datetime
    add_column :events, :end, :datetime
    add_column :events, :color, :string
  end
end
