FactoryBot.define do
  factory :task do
    title { "MyString" }
    description { "MyText" }
    date { "2022-12-07 10:35:20" }
    priority { 1 }
    completed { false }
  end
end
