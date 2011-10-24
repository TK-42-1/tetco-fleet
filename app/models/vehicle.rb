# == Schema Information
#
# Table name: vehicles
#
#  id         :integer         not null, primary key
#  plate      :string(255)
#  vin        :string(255)
#  make       :string(255)
#  model      :string(255)
#  year       :integer
#  driver_id  :integer
#  status     :string(255)
#  milage     :integer
#  created_at :datetime
#  updated_at :datetime
#

class Vehicle < ActiveRecord::Base
  attr_accessible :plate, :status, :vin, :make, :model, :year, :driver_id, :milage
  
  make_regex = /[a-z]*/i
  
  validates :vin, :length => {:is => 17}
  validates :plate, :length => { :minimum => 5, :maximum => 7 }, :allow_nil => false
  validates :make, :model, :status, :presence => true
  validates_length_of :year, :is => 4
end



