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

    factory :order_with_products do
      transient do
        product_count {3}
      end

      after(:create) do |order, evaluator|
        create_list(:product, evaluator.product_count, order: order)
      end
    end
  end
end
