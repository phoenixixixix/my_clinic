require 'rails_helper'

RSpec.describe Patient, type: :model do
  subject {
    described_class.new(
      email: "test_patient@mail.com",
      password: "test_patient",
      password_confirmation: "test_patient"
    )
  }

  it { expect(subject).to be_valid }

  describe "Relations" do
    context "has many Doctors" do
      let(:doctor) { build(:doctor) }

      it "should have Doctor through Appointment" do
        doctor.email = "exact@doctor.com"
        subject.appointments.build(doctor: doctor)
        subject.save

        doctors = subject.doctors

        expect(doctors).to include(doctor)
        expect(doctors.last.email).to eq("exact@doctor.com")
      end
    end
  end
end
