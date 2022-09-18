class MedicalSpecialty < ApplicationRecord
  has_and_belongs_to_many :doctors, join_table: "doctors_medical_specialties"

  validates :title, uniqueness: true, presence: true
end
