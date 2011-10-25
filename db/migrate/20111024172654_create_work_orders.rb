class CreateWorkOrders < ActiveRecord::Migration
  def change
    create_table :work_orders do |t|
      t.integer :vehicle_id
      t.string :invoice
      t.string :inv_date
      t.integer :milage
      t.decimal :cost, precision: 8, scale: 2 
      t.string :category
      t.string :description
      t.string :serviced

      t.timestamps
    end
  end
end
