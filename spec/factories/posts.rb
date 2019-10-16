FactoryBot.define do
  factory :post do
    sub_reddit { create(:sub_reddit) }
    user { create(:user) }
    title { "Post Title" }
    content { "This is the content of the post" }
    image { "No Image" }
  end
end
