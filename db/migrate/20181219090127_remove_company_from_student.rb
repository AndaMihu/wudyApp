class RemoveCompanyFromStudent < ActiveRecord::Migration[5.2]
  def change
    remove_column :students, :company_id
  end
end
