# == Schema Information
#
# Table name: cart_items
#
#  id         :bigint           not null, primary key
#  product_id :bigint           not null
#  size       :string           not null
#  quantity   :integer          not null
#  user_id    :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class CartItem < ApplicationRecord
  validate :size, :presence
  validates :quantity, numericality: {greater_than_or_equal_to: 1,  less_than_or_equal_to: 10 }

  belongs_to :product
  belongs_to :user

end
