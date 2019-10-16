FactoryBot.define do
  factory :comment do
    user { create(:user) }
    post { create(:post) }
    content { 'This is my comment yay !' }
  end
end
