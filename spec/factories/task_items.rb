FactoryBot.define do
  factory :task_item do
    content { "MyString" }
    task_list { nil }
  end
end
