class AddDefaultFalseValueToStudentsAccepted < ActiveRecord::Migration[5.2]
  def up
    change_column :students, :accepted, :boolean, default: false
  end
  
  def down
    change_column :students, :accepted, :boolean, default: nil
  end
end