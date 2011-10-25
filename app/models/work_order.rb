class WorkOrder < ActiveRecord::Base
  belongs_to :vehicle
end

# == Schema Information
#
# Table name: work_orders
#
#  id          :integer         not null, primary key
#  vehicle_id  :integer
#  invoice     :string(255)
#  inv_date    :string(255)
#  milage      :integer
#  cost        :decimal(8, 2)
#  category    :string(255)
#  description :string(255)
#  serviced    :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#

