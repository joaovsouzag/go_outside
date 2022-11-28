class CreateLocations < ActiveRecord::Migration[7.0]
  def change
    create_table :locations do |t|
      t.string :address
      t.string :name
      t.string :location_type
      t.string :photos

      t.timestamps
    end
  end
end
