require 'rails_helper'

RSpec.describe Appointment, type: :model do
  let(:patient) { build :patient }
  let(:doctor) { build :doctor }
  subject {
    described_class.new(
      patient: patient,
      doctor: doctor
    )
  }

  it { expect(subject).to be_valid }

  describe "Relations" do
    context "belonging" do
      it "should be invalid without patient" do
        subject.patient = nil

        expect(subject).to be_invalid
        expect(subject.errors.full_messages).to include("Patient must exist")
      end

      it "should be invalid without doctor" do
        subject.doctor = nil

        expect(subject).to be_invalid
        expect(subject.errors.full_messages).to include("Doctor must exist")
      end
    end

    context "has one Recommendation" do
      let(:recommendation) { build(:recommendation, diagnosis: "Existing")}

      before do
        subject.recommendation = recommendation
        subject.save
      end

      it "should not be able to add more that one Recommendation" do
        expect {
          subject.create_recommendation(diagnosis: "Redundant", instruction: "Redundant")
        }.to raise_error("Failed to remove the existing associated recommendation. The record failed to save after its foreign key was set to nil.")
        expect(subject.recommendation.diagnosis).to eq("Existing")
      end
    end
  end
end
