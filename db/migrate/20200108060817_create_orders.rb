class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :order_no
      t.date :delivery_date
      t.string :special_instruction
      t.integer :tracking_number
      t.decimal :order_total
      t.decimal :discount
      t.string :order_type
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
