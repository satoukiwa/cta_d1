class CreateTrainStatuses < ActiveRecord::Migration
  def change
    create_table :train_statuses do |t|
      t.string :train_number
      t.string :status

      t.timestamps

    end
  end
end
