@cart_items.each do |item|
    json.set! item.id do
        json.extract! item, :id, :size, :quantity, :checked_out, :product_id, :user_id
        json.extract! item.product, :name, :sale_price, :list_price, :subtitle, :division, :category
        json.photosUrl item.product.photos.attached? ? [item.product.photos[0].url] : nil
    end
 end