class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :contact
      t.date :birthdate
      t.string :role

      t.timestamps
    end
  end
end
