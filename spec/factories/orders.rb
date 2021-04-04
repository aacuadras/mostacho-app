require 'date'

FactoryBot.define do
  factory :order do
    sequence(:name) {|n| "Person #{n}"}
    delivery_date { Date.today }
    status { "complete" }

    trait :ready_to_deliver do
      status { "ready_to_deliver" }
    end

    trait :active do
      status { "active" }
    end

    factory :order_with_products do
      transient do
        products_count {3}
      end

      after(:create) do |order, evaluator|
        create_list(:product, evaluator.products_count, orders: [order])
      end
    end
  end
end
