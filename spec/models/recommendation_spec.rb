require 'rails_helper'

RSpec.describe Recommendation, type: :model do
  let(:appointment) { build(:appointment) }
  subject {
    described_class.new(
      appointment: appointment,
      diagnosis: "Test_diagnosis",
      instruction: "Test_instructions"
    )
  }

  it { expect(subject).to be_valid }

  describe "Methods" do
    context "#update_appointment_status" do
      it "should update appointment status after create Recommendation" do
        opened_appointment = appointment
        opened_appointment.opened!
        expect(opened_appointment.opened?).to be_truthy

        subject.appointment = opened_appointment
        subject.save

        expect(subject.appointment.closed?).to be_truthy
      end
    end
  end

  describe "Relations" do
    context "belonging" do
      it "should be invalid without appointment" do
        subject.appointment = nil

        expect(subject).to be_invalid
        expect(subject.errors.full_messages).to include("Appointment must exist")
      end
    end
  end
end
