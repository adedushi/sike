
json.products do
    @products.each do |product|
        json.set! product.id do
            json.extract! product, :id, :name, :subtitle, :description, :list_price, 
            :sale_price, :article_number, :division, :category, :sub_category
        end
    end
end