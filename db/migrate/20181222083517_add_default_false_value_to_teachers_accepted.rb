class AddDefaultFalseValueToTeachersAccepted < ActiveRecord::Migration[5.2]
  def up
    change_column :teachers, :accepted, :boolean, default: false
  end
  
  def down
    change_column :teachers, :accepted, :boolean, default: nil
  end
end
