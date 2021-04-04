FactoryBot.define do
  factory :product do
    sequence(:name) {|n| "Cake #{n}"}
    price { 9.99 }
  end
end
