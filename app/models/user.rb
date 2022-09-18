class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def doctor?
    type == "Doctor"
  end
  def patient?
    type == "Patient"
  end
end
