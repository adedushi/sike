@cart_items.each do |item|
    json.set! item.id do
        json.extract! item, :id, :size, :quantity, :checked_out
    end
 end