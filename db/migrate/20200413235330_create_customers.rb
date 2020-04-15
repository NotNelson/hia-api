class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.references :person, null: false, foreign_key: true
      t.integer :weight
      t.string :passport_no
      t.date :passport_expiry

      t.timestamps
    end
  end
end
