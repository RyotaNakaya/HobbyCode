class CreateCategoryConfigs < ActiveRecord::Migration[5.2]
  def change
    drop_table :category_configs

    create_table :category_configs do |t|
      t.integer :category_no
      t.string :category_name
      t.integer :category_grp_id
      t.integer :disp_order
      t.integer :user_id

      t.timestamps
    end
  end
end
