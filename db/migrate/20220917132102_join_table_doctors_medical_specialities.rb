class JoinTableDoctorsMedicalSpecialities < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors_medical_specialties, id: false do |t|
      t.belongs_to :doctor, index: { unique: true }
      t.belongs_to :medical_specialty
    end
  end
end
