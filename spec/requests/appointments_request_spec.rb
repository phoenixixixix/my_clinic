require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  let(:doctor) { build(:doctor) }

  current_user = Patient.first_or_create!(
    email: "current_user@mail.com",
    password: "password",
    password_confirmation: "password"
  )


  describe "POST /appointments" do
    before do
      doctor.save
    end

    it "should create Appointment" do
      expect {
        appointment = Appointment.new(doctor_id: doctor.id)
        appointment.patient = current_user
        appointment.save
        post appointments_url
      }.to change(Appointment, :count).by(1)

      record = Appointment.last
      expect(record.patient.email).to eq(current_user.email)
      expect(record.doctor.email).to eq(doctor.email)
    end
  end
end
