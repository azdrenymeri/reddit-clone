FactoryBot.define do
  factory :sub_reddit do
    user {create(:user)}
    title { 'subreddit title' }
    description { 'subreddit description' }
    picture { "https://st2.depositphotos.com/4347477/7404/v/950/depositphotos_74041431-stock-illustration-seamless-pattern-with-yellow-rubber.jpg" }
  end
end
