class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :plate
      t.string :vin
      t.string :make
      t.string :model
      t.integer :year
      t.integer :driver_id
      t.string :status
      t.integer :milage

      t.timestamps
    end
  end
end
