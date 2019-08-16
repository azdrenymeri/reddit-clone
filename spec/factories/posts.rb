FactoryBot.define do
  factory :post do
    sub_reddit { nil }
    title { "MyString" }
    content { "MyText" }
    image { "" }
  end
end
