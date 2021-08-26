class CreateResidences < ActiveRecord::Migration[6.0]
  def change
    create_table :residences do |t|
      t.references :purchase,           null: false, foreign_key: true
      t.integer :delivery_zone_id,      null: false
      t.string :building_name         
      t.string :post_number,             null: false
      t.string :municipalities,            null: false
      t.string :address,                    null: false
      t.string :phone_number,          null: false
      t.timestamps
    end
  end
end