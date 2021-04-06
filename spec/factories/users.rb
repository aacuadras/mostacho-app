FactoryBot.define do
  factory :user do
    email {Faker::Internet.safe_email}
    password {"foobar123"}
  end
end
