class AddBooleanToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :accepted, :boolean
  end
end
