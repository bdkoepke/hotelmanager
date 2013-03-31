class Invoice < ActiveRecord::Base
  belongs_to :reservation
  attr_accessible :total, :reservation_id
end
