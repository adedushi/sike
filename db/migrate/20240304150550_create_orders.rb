class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.float :subtotal, null: false
      t.float :shipping, null: false
      t.float :total, null: false

      t.timestamps
    end
  end
end
