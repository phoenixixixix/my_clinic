FactoryBot.define do
  factory :doctor do
    email { "doctor@mail.com" }
    password { "password" }
    password_confirmation { "password" }
  end
end
