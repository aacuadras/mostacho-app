require 'date'

FactoryBot.define do
  factory :order do
    sequence(:name) {|n| "Person #{n}"}
    delivery_date { Date.today }
    status { "active" }

    trait :ready_to_deliver do
      status { "ready_to_deliver" }
    end

    trait :complete do
      status { "complete" }
    end

    factory :order_with_products do
      transient do
        products_count {3}
      end

      after(:create) do |order, evaluator|
        create_list(:invoice, evaluator.products_count, order: order)
      end
    end
  end
end
