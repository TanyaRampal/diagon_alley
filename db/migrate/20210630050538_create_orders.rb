class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.bigint :user_id
      t.datetime :ordered_on
      t.datetime :delivered_on
      t.string :delivered_by
      t.string :walk_in_customer

      t.timestamps
    end
  end
end
