class Driver < ActiveRecord::Base
  has_many :vehicles
  
  def full_name
    "#{fname} #{lname}"
  end
end

# == Schema Information
#
# Table name: drivers
#
#  id         :integer         not null, primary key
#  fname      :text
#  lname      :text
#  created_at :datetime
#  updated_at :datetime
#

