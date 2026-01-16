FactoryBot.define do
  factory :platform do
    name { "PlayStation 3" }
    manufacturer { "Sony" }
    generation { 7 }

    # Use sequence for unique slugs in multiple test records
    sequence :slug do |n|
      "platform-#{n}"
    end
  end
end
