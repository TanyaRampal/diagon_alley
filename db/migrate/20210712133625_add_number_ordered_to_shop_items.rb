class AddNumberOrderedToShopItems < ActiveRecord::Migration[6.1]
  def change
    add_column :shop_items, :number_ordered, :bigint
  end
end
