FactoryBot.define do
  factory :room do
    name      {"test"}
    association :post
  end
end
