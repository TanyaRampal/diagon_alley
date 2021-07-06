class CreateShopItems < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_items do |t|
      t.bigint :shop_category_id
      t.string :name
      t.string :description
      t.float :price

      t.timestamps
    end
  end
end
