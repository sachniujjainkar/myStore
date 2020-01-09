class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :sku
      t.integer :quantity
      t.string :currency
      t.decimal :price
      t.string :images
      t.string :inbox

      t.timestamps
    end
  end
end
