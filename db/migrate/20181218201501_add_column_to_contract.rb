class AddColumnToContract < ActiveRecord::Migration[5.2]
  def change
    add_reference :contracts, :company, foreign_key: true
  end
end
