FactoryBot.define do
  factory :invoice do
    quantity { 1 }
    association :order, factory: :order, strategy: :create
    association :product, factory: :product, strategy: :create
  end
end
