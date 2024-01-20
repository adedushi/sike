json.extract! @product, :id, :name, :subtitle, :description, :list_price, 
        :sale_price, :article_number, :division, :category, :sub_category
# json.photosUrl @product.photos.attached? ? @product.photos.map { |photo| photo.url} : nil
