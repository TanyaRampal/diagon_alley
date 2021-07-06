class CreateShopCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :shop_categories do |t|
      t.bigint :shop_id
      t.string :name

      t.timestamps
    end
  end
end
