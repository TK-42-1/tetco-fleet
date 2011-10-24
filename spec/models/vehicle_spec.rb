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

require 'spec_helper'

describe Vehicle do
  
  before(:each) do
    @attr = { :plate  => "RJC324",
              :vin    => "LJCPCBLCX11000237",
              :make   => "honda",
              :model  => "accord", 
              :year   => "2004", 
              :status => "Active" }
  end
  
  describe "success" do
  
    it "should create a new vehicle with valid attribs" do
      Vehicle.create!(@attr)
    end
  end
  
  describe "failure" do
  
    it "should not make a new vehicle if the plate is too long" do
      long_plate = Vehicle.new(@attr.merge( :plate => "a"*8 ))
      long_plate.should_not be_valid
    end
  
    it "should not make a new entry if the plate is too short" do
      short_plate = Vehicle.new(@attr.merge( :plate => "a"*4 ))
      short_plate.should_not be_valid
    end
    
    it "should not make a new entry unless the VIN is 17 characters" do
      bad_vin = Vehicle.new(@attr.merge( :vin => "1"*15 ))
      bad_vin.should_not be_valid
    end
    
    it "should require a make" do
      no_make = Vehicle.new(@attr.merge( :make => ""))
      no_make.should_not be_valid
    end
    
    it "should require a model" do
      no_model = Vehicle.new(@attr.merge( :model => ""))
      no_model.should_not be_valid
    end
    
    it "should not make a new entry with no year" do
      no_year = Vehicle.new(@attr.merge( :year => ""))
    end
    
    it "should not accept non-integer years" do
      letter_year = Vehicle.new(@attr.merge( :year => "200a"))
      letter_year.should_not be_valid
    end
    
    it "should not accept a bad year entry" do
      bad_year = Vehicle.new(@attr.merge( :year => "198"))
      bad_year.should_not be_valid
    end
    
    it "should require a status" do
      no_status = Vehicle.new(@attr.merge( :status => ""))
      no_status.should_not be_valid
    end
  end
end