class CreateIntStatLens < ActiveRecord::Migration
  def change
    create_table :int_stat_lens do |t|
      t.integer :dstopid
      t.integer :astopid
      t.float :distance

      t.timestamps

    end
  end
end
