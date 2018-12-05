class AddColumnToTeacher < ActiveRecord::Migration[5.2]
  def change
    add_column :teachers, :access_token, :string
    add_column :teachers, :refresh_token, :string

  end
end
