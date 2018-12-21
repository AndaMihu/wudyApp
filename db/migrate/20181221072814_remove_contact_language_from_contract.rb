class RemoveContactLanguageFromContract < ActiveRecord::Migration[5.2]
  def change
    remove_column :contracts, :contact_language_id
  end
end
