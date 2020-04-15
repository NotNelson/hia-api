class CreateMaintenances < ActiveRecord::Migration[6.0]
  def change
    create_table :maintenances do |t|
      t.references :employee, null: false, foreign_key: true
      t.references :aircraft, null: false, foreign_key: true
      t.date :date_scheduled
      t.text :comments

      t.timestamps
    end
  end
end
