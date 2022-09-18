require 'rails_helper'

RSpec.describe MedicalSpecialty, type: :model do
  subject {
    described_class.new(
      title: "Specialty_Test"
    )
  }

  it { expect(subject).to be_valid }

  describe "Validations" do
    describe "Attributes" do
      context "uniqueness validation" do
        it "should not create MedicalSpecialty with the same Title" do
          subject.title = "Unique Title"
          subject.save

          test_ms = MedicalSpecialty.new(title: subject.title)

          expect(test_ms.title).to eq(subject.title)
          expect(test_ms).to be_invalid
          expect(test_ms.errors.full_messages).to include("Title has already been taken")
        end
      end
    end
  end

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
