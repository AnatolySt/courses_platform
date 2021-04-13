FactoryBot.define do
  factory :group do
    sequence(:title) { |n| "Group_#{n}" }
    starts_at { Time.zone.today }
    ends_at { Time.zone.today + 2.months }
    course
    trait :with_students do
      students { build_list :student, 2 }
    end
  end
end