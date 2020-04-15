class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.integer :origin
      t.integer :destination
      t.decimal :fare

      t.timestamps
    end
  end
end
