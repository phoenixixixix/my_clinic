class Recommendation < ApplicationRecord
  belongs_to :appointment

  after_create :update_appointment_status

  private

  def update_appointment_status
    appointment.closed!
  end
end
