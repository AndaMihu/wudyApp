class AddColumnToChat < ActiveRecord::Migration[5.2]
  def change
    add_reference :chats, :student, foreign_key: true
    add_reference :chats, :teacher, foreign_key: true
  end
end
