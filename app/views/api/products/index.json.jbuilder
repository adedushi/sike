json.products do
    @products.each do |product|
        json.set! product.id do
            json.extract! product, :id, :name, :subtitle, :description, :list_price, 
            :sale_price, :article_number, :division, :category, :sub_category
            json.photosUrl product.photos.attached? ? [product.photos[0].url] : nil
        end
    end
end

json.pagy do
  json.total_pages @pagy.pages
  json.total_items @pagy.count
  json.items_per_page @pagy.vars[:items]
  json.page @pagy.page
end