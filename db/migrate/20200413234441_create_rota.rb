class CreateRota < ActiveRecord::Migration[6.0]
  def change
    create_table :rota do |t|
      t.references :employee, null: false, foreign_key: true
      t.date :shift_date
      t.datetime :time_start
      t.datetime :time_end

      t.timestamps
    end
  end
end
