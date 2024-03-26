@order_items.each do |order_item|
    json.set! order_item.id do
        json.extract! order_item, :id, :order_id, :product_id, :size, :quantity, 
        :price, :created_at
        json.extract! order_item.product, :name, :article_number, :sub_category
    end
end