FactoryBot.define do
  factory :recommendation do
    appointment
    diagnosis { "Good" }
    instruction { "Do sports" }
  end
end
