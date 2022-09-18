class AddNullFalseToColumns < ActiveRecord::Migration[7.0]
  def change
    change_column :users, :type, :string, null: false
    change_column :medical_specialties, :title, :string, null: false
    change_column :appointments, :doctor_id, :bigint, null: false
    change_column :appointments, :patient_id, :bigint, null: false
  end
end
