class AddColumnsToContractTeacherAccepts < ActiveRecord::Migration[5.2]
  def change
    add_reference :contract_teacher_accepts, :contract, foreign_key: true
    add_reference :contract_teacher_accepts, :teacher, foreign_key: true
    add_column :contract_teacher_accepts, :accept, :boolean
  end
end
