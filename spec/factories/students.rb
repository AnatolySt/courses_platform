FactoryBot.define do
  factory :student do
    sequence(:full_name) { |n| "John_Lennon_#{n}" }
    email { "#{random_name}@mail.com" }
    trait :with_groups do
      groups { build_list :group, 2 }
    end
  end
end

def random_name
  ('a'..'z').to_a.shuffle.join
end