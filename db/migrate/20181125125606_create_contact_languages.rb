class CreateContactLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :contact_languages do |t|
      t.string :name

      t.timestamps
    end
  end
end
