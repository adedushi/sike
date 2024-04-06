class RemoveCheckedOutFromCartItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :cart_items, :checked_out, :boolean
  end
end
