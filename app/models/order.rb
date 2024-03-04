# == Schema Information
#
# Table name: orders
#
#  id         :bigint           not null, primary key
#  user_id    :bigint           not null
#  subtotal   :float            not null
#  shipping   :float            not null
#  total      :float            not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items
  validates :subtotal, :shipping, :total, presence: true
end
