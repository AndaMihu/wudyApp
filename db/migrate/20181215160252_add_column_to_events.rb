class AddColumnToEvents < ActiveRecord::Migration[5.2]
  def change
    add_reference :events, :teacher, foreign_key: true
  end
end
