FactoryBot.define do
  factory :comment do
    user { nil }
    content { "MyString" }
    discussion { nil }
  end
end
