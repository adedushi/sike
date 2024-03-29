# == Schema Information
#
# Table name: products
#
#  id             :bigint           not null, primary key
#  name           :string           not null
#  subtitle       :string           not null
#  description    :text             not null
#  list_price     :float            not null
#  sale_price     :float
#  article_number :string           not null
#  division       :string           not null
#  category       :string           not null
#  sub_category   :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
class Product < ApplicationRecord
     has_many :cart_items
     has_many :order_items
     has_many_attached :photos

     validates :name, :subtitle, :description, :list_price, 
     :division, :category, :sub_category, presence: true

     validates :article_number, presence: true, uniqueness: true
end
