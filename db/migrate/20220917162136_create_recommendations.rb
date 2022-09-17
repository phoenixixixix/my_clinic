class CreateRecommendations < ActiveRecord::Migration[7.0]
  def change
    create_table :recommendations do |t|
      t.belongs_to :appointment
      t.string :diagnosis
      t.text :instruction

      t.timestamps
    end
  end
end
