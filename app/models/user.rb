class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validate :exclusively_manager_is_admin

  def doctor?
    type == "Doctor"
  end
  def patient?
    type == "Patient"
  end

  def manager?
    type == "Manager"
  end

  private

  def exclusively_manager_is_admin
    if admin? && !manager?
      errors.add(:admin, :not_manager, message: "User must be type Manager to be Admin")
    end
  end
end
