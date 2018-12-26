class AddDefaultValueToStudentsAccepted < ActiveRecord::Migration[5.2]
  def up
    change_column :students, :accepted, :boolean, default: true
  end
  
  def down
    change_column :students, :accepted, :boolean, default: nil
  end
end

