FactoryBot.define do
  factory :order do
    name { "Person" }
    delivery_date { "2021-03-25" }

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
