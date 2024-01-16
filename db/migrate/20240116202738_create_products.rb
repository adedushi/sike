class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :subtitle, null: false
      t.text :description, null: false
      t.float :list_price, null: false
      t.float :sale_price
      t.string :article_number, null: false
      t.string :division, null: false
      t.string :category, null: false
      t.string :sub_category, null: false

      t.timestamps
    end
    add_index :products, :article_number, unique: true
  end
end
