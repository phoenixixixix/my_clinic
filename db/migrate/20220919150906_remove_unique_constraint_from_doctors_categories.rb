class RemoveUniqueConstraintFromDoctorsCategories < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        remove_index :doctors_medical_specialties, :doctor_id
        add_index :doctors_medical_specialties, :doctor_id
      end

      dir.down do
        remove_index :doctors_medical_specialties, :doctor_id
        add_index :doctors_medical_specialties, :doctor_id, unique: true
      end
    end
  end
end
