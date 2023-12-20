class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :name
      t.text :detail
      t.integer :category_id
      t.integer :condition_id
      t.integer :shipping_charge_id
      t.integer :ship_form_to_id
      t.integer :days_to_ship_date_id
      t.integer :price
      t.timestamps
    end
  end
end
