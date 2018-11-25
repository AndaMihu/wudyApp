class AddContactLanguageToContract < ActiveRecord::Migration[5.2]
  def change
    add_reference :contracts, :contact_language, foreign_key: true
  end
end
