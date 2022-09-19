class Doctor < User
  has_many :appointments, dependent: :destroy
  has_many :patients, through: :appointments
  has_and_belongs_to_many :categories,
                          class_name: "MedicalSpecialty",
                          foreign_key: "doctor_id",
                          association_foreign_key: "medical_specialty_id",
                          join_table: "doctors_medical_specialties"
end
