FactoryBot.define do
  factory :post do
    name          {"test"}
    content       {"テスト用のコンテンツです。"}
    association :user
  end
end
