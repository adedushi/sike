json.set! @cart_item.id do
    json.extract! @cart_item, :id, :size, :quantity, :checked_out, :product_id, :user_id
    json.extract! @cart_item.product, :name, :sale_price, :list_price, :subtitle, :division, :category
    json.photosUrl @cart_item.product.photos.attached? ? [@cart_item.product.photos[0].url] : nil
end