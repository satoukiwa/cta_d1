class CreateStopData < ActiveRecord::Migration
  def change
    create_table :stop_data do |t|
      t.string :station_name
      t.string :stop_name
      t.float :long
      t.float :lat
      t.integer :stop_id
      t.integer :map_id
      t.string :direction_id
      t.float :mileage

      t.timestamps

    end
  end
end
