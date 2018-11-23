class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :category1
      t.string :category2
      t.string :string
      t.integer :disp_order
      t.string :user_id

      t.timestamps
    end
  end
end
