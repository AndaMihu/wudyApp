class RemoveContactLanguageFromContract < ActiveRecord::Migration[5.2]
  def change
    remove_column :contracts, :contact_language, :string

  end
end
