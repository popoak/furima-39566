class CreateShippings < ActiveRecord::Migration[7.0]
  def change
    create_table :shippings do |t|

      t.timestamps
      t.string :postal_code,                 null: false
      t.integer :prefecture_id,              null: false
      t.string :city,                        null: false
      t.string :address,                     null: false
      t.string :building_name               
      t.references :purchase,         null: false, foreign_key: true  
      t.string :tel,                         null: false 
    end
  end
end
