class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.text :fname
      t.text :lname

      t.timestamps
    end
  end
end
