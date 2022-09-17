require 'rails_helper'

RSpec.describe Doctor, type: :model do
  subject {
    described_class.new(
      email: "test_doctor@mail.com",
      password: "test_doctor",
      password_confirmation: "test_doctor"
    )
  }

  it { expect(subject).to be_valid }

  describe "Relations" do
    context "has many Patients" do
      let(:patient) { build(:patient) }

      it "should have Patient through Appointment" do
        patient.email = "exact@patient.com"
        subject.appointments.build(patient: patient)
        subject.save

        patients = subject.patients

        expect(patients).to include(patient)
        expect(patients.last.email).to eq("exact@patient.com")
      end
    end
  end
end
