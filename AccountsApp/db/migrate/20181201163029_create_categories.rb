class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :ctg_name
      t.integer :disp_order
      t.boolean :sub_flg
      t.integer :parent_id
      t.integer :user_id
      
      t.timestamps
    end
  end
end
