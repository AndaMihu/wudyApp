class AddColumnsToStudent < ActiveRecord::Migration[5.2]
  def change
    add_column :students, :good_want, :string
    add_column :students, :good_not, :string
    add_column :students, :bad_want, :string
    add_column :students, :bad_not, :string
  end
end
