class CreateMedicalSpecialties < ActiveRecord::Migration[7.0]
  def change
    create_table :medical_specialties do |t|
      t.string :title

      t.timestamps
    end
  end
end
