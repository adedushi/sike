json.set! @cart_item.id do
    json.extract! @cart_item, :id, :size, :quantity, :checked_out
end
