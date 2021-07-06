class Shop < ActiveRecord::Base
  validates :name, presence: :true
  validates :shop_image, attached: true

  has_one_attached :shop_image

  has_many :shop_categories
end
