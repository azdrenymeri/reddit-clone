FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password { '123456' }
    password_confirmation { '123456' }
    birth_date { Date.new(1972,2,2) }
    full_name { Faker::Name.name }
    bio { Faker::Quote.famous_last_words }
  end
end
