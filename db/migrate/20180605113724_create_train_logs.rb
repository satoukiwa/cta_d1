class CreateTrainLogs < ActiveRecord::Migration
  def change
    create_table :train_logs do |t|
      t.string :train_number
      t.string :station_name
      t.string :stop_name
      t.string :train_locationbasestation
      t.datetime :record_time
      t.string :train_locationmileage

      t.timestamps

    end
  end
end
