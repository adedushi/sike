json.order do
    json.extract! @order, :id, :subtotal, :shipping, :total, :created_at
    json.order_items do
        @order.order_items.each do |order_item|
            json.set! order_item.id do
                json.extract! order_item, :id, :order_id, :product_id, :size, :quantity, 
                :price, :created_at
            end
        end
    end
end