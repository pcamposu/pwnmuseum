FactoryBot.define do
  factory :hacker do
    sequence(:handle) { |n| "hacker_#{n}" }
    team { false }
  end
end
