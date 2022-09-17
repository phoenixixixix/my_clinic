FactoryBot.define do
  factory :patient do
    email { "patient@mail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
