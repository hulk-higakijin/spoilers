FactoryBot.define do
  factory :user do
    name                  { "higakijin" }
    email                 { "higakijin@example.com" }
    password              { "iamhigakijin" }
    password_confirmation { "iamhigakijin" }
  end
end
