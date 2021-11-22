class CreateTemperatures < ActiveRecord::Migration[6.1]
  def change
    create_table :temperatures do |t|
      t.integer :max_cold_temp
      t.integer :min_hot_temp

      t.timestamps
    end
  end
end
