class CreateAircrafts < ActiveRecord::Migration[6.0]
  def change
    create_table :aircrafts do |t|
      t.string :name
      t.integer :year
      t.references :aircraft_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
