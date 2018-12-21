class RemoveColumnFromContract < ActiveRecord::Migration[5.2]
  def change
    remove_column :contracts, :name, :string
  end
end
