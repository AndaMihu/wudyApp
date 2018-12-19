class AddColumnsToStudentProgramme < ActiveRecord::Migration[5.2]
  def change
    add_reference :student_programmes, :student, foreign_key: true
    add_reference :student_programmes, :programme, foreign_key: true
  end
end
