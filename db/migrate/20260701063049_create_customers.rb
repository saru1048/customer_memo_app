class CreateCustomers < ActiveRecord::Migration[8.1]
  def change
    create_table :customers do |t|
      t.string :name, null: false
      t.string :name_kana
      t.string :phone_number
      t.text :memo

      t.timestamps
    end
  end
end
