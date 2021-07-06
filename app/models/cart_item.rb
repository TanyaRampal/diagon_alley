class CartItem < ActiveRecord::Base
  belongs_to :cart
  belongs_to :shop_item

  def self.in_cart?(item_name)
    find_by(shop_item_name: item_name) ? find_by(shop_item_name: item_name) : false
  end
end
