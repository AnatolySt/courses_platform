FactoryBot.define do
  factory :course do
    sequence(:title) { |n| "Course_#{n}" }
    description { "Description" }
    trait :with_groups do
      groups { build_list :group, 2 }
    end
  end
end