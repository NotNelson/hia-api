class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :last_name
      t.string :names
      t.date :birth_date

      t.timestamps
    end
  end
end
