class AddTotalToOrderProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :order_products, :total, :decimal
  end
end
