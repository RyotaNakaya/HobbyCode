class AddCategoryIdToPostdatum < ActiveRecord::Migration[5.2]
  def change
    add_column :postdata, :categroy_id, :integer
  end
end
