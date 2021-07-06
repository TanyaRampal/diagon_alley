class CreateCartItems < ActiveRecord::Migration[6.1]
  def change
    create_table :cart_items do |t|
      t.bigint :cart_id
      t.bigint :shop_item_id
      t.string :shop_item_name
      t.float :shop_item_price
      t.bigint :quantity

      t.timestamps
    end
  end
end
