class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.references :person, null: false, foreign_key: true
      t.date :date_start
      t.string :section
      t.boolean :is_active

      t.timestamps
    end
  end
end
