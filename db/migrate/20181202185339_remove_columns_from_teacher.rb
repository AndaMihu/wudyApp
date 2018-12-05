class RemoveColumnsFromTeacher < ActiveRecord::Migration[5.2]
  def change
    remove_column :teachers, :token, :string
    remove_column :teachers, :uid, :string
    remove_column :teachers, :provider, :string
  end
end
