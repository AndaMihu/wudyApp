class RemoveLocationFromCompany < ActiveRecord::Migration[5.2]
  def change
    remove_column :companies, :location, :string
  end
end
