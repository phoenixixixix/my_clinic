class Appointment < ApplicationRecord
  enum status: { opened: 0, closed: 1 }

  belongs_to :patient
  belongs_to :doctor
  has_one :recommendation

  validate :max_10_opened_appointments, on: :create

  private

  def max_10_opened_appointments
    if doctor.appointments.opened.count >= 10
      errors.add(:base, :too_much, message: "It's already 10 Appointments on this Doctor")
    end
  end
end
