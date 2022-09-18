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

  describe "Attributes" do
    describe "Status" do
      before do
        subject.recommendation.destroy if subject.recommendation
        subject.opened!
      end

      it { expect(subject.opened?).to be_truthy}

      it "should update status on create Recommendation" do
        subject.create_recommendation!(diagnosis: "Closes Status", instruction: "Test")

        expect(subject.recommendation.diagnosis).to eq("Closes Status")
        expect(subject.closed?).to be_truthy
      end
    end
  end

  describe "Relations" do
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
