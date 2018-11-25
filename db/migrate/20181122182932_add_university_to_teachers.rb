class AddUniversityToTeachers < ActiveRecord::Migration[5.2]
  def change
    add_reference :teachers, :university, foreign_key: true
  end
end
