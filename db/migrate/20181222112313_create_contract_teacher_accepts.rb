class CreateContractTeacherAccepts < ActiveRecord::Migration[5.2]
  def change
    create_table :contract_teacher_accepts do |t|

      t.timestamps
    end
  end
end
