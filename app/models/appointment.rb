class Appointment < ApplicationRecord
  enum status: { opened: 0, closed: 1 }

  belongs_to :patient
  belongs_to :doctor
  has_one :recommendation
end
