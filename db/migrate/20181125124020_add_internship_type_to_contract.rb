class AddInternshipTypeToContract < ActiveRecord::Migration[5.2]
  def change
    add_reference :contracts, :internship_type, foreign_key: true
  end
end
