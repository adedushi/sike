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
require "test_helper"

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
