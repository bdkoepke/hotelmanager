class Invoice < ActiveRecord::Base
  belongs_to :reservation
  attr_accessible :total, :reservation_id

  #scopes for balance ..
  scope :clear_balance, Invoice.joins("LEFT OUTER JOIN reservations where status = 'Checked-out'")
  scope :outstanding_balance, Invoice.joins("LEFT OUTER JOIN reservations where status != 'Checked-out'")
end
