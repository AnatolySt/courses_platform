FactoryBot.define do
  factory :group do
    sequence(:title) { |n| "Group_#{n}" }
    starts_at { rand(1..100).days.from_now }
    ends_at { 6.months.from_now }
    course
    students { build_list :student, 2 }
  end
end