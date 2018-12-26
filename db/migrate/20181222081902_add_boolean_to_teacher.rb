class AddBooleanToTeacher < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :accepted, :boolean
  end
end
