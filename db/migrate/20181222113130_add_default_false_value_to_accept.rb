class AddDefaultFalseValueToAccept < ActiveRecord::Migration[5.2]
  def up
    change_column :contract_teacher_accepts, :accept, :boolean, default: false
  end
  
  def down
    change_column :contract_teacher_accepts, :accept, :boolean, default: nil
  end
end
