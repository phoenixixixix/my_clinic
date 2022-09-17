require 'rails_helper'

RSpec.describe MedicalSpecialty, type: :model do
  subject {
    described_class.new(
      title: "Specialty_Test"
    )
  }

  it { expect(subject).to be_valid }

  describe "Relations" do
    context "has_and_belongs_to_many Doctors" do
      let(:doctor) { build(:doctor, email: "exact@medical.specialty")}

      it "should add Doctor to Specialty" do
        subject.doctors << (doctor)

        doctors = subject.doctors

        expect(doctors).to include(doctor)
        expect(doctors.last.email).to eq("exact@medical.specialty")
      end
    end
  end
end
