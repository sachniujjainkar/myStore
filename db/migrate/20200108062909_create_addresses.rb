class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :line1
      t.string :line2
      t.string :line3
      t.string :city
      t.string :district
      t.string :state
      t.string :country
      t.integer :zip_code
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
