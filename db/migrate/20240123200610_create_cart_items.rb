class CreateCartItems < ActiveRecord::Migration[7.0]
  def change
    create_table :cart_items do |t|
      t.references :product, null: false, foreign_key: true
      t.string :size, null: false
      t.integer :quantity, null: false
      t.references :user, null: false, foreign_key: true
      t.boolean :checked_out, null: false, default: false

      t.timestamps
    end
  end
end
