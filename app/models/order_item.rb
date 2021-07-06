class OrderItem < ActiveRecord::Base
  belongs_to :order
  belongs_to :shop_item
end
