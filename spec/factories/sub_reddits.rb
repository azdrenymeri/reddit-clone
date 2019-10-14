FactoryBot.define do
  factory :sub_reddit do
    title { Faker::Quotes::Shakespeare.hamlet_quote }
    description { Faker::ChuckNorris.fact }
    picture { "https://st2.depositphotos.com/4347477/7404/v/950/depositphotos_74041431-stock-illustration-seamless-pattern-with-yellow-rubber.jpg" }
  end
end
