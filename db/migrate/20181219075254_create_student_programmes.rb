class CreateStudentProgrammes < ActiveRecord::Migration[5.2]
  def change
    create_table :student_programmes do |t|

      t.timestamps
    end
  end
end
