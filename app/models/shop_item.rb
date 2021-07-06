class ShopItem < ActiveRecord::Base
  validates :name, presence: :true
  validates :description, presence: :true
  validates :price, presence: :true

  has_one_attached :shop_item_image

  belongs_to :shop_category
end
