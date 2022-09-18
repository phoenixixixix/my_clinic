class AddUniqueIndexForMedicalSpecialtiesTitle < ActiveRecord::Migration[7.0]
  def change
    add_index :medical_specialties, :title, unique: true
  end
end
