require 'date'

FactoryBot.define do
  factory :order do
    name { "Person" }
    delivery_date { Date.today }

    trait :complete do
      status { "complete" }
    end

    trait :ready_to_deliver do
      status { "ready_to_deliver" }
    end

    trait :active do
      status { "active" }
    end
  end
end
