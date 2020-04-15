class CreateBookings < ActiveRecord::Migration[6.0]
  def change
    create_table :bookings do |t|
      t.references :flight, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.date :date_created
      t.boolean :is_confirmed
      t.boolean :is_cancelled

      t.timestamps
    end
  end
end
