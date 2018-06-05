class CreateTimeTables < ActiveRecord::Migration
  def change
    create_table :time_tables do |t|
      t.string :train_number
      t.string :station_name
      t.string :stop_name
      t.time :arrival_time
      t.time :departure_time
      t.string :stop_id
      t.date :date

      t.timestamps

    end
  end
end
