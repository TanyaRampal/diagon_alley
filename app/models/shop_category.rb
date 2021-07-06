class ShopCategory < ActiveRecord::Base
  validates :name, presence: :true

  has_many :shop_items
  belongs_to :shop

  def destroy
  end
end
