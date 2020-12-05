FactoryBot.define do
  factory :user do
    nickname      {"サンプルネーム"}
    email         {"sample@gmail.com"}
    password      {"test1111"}
    password_confirmation {password}
  end
end
