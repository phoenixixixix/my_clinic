class MedicalSpecialty < ApplicationRecord
  has_and_belongs_to_many :doctors, join_table: "doctors_medical_specialties"
end
