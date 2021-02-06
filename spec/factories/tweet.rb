FactoryBot.define do
  factory :tweet do
    sequence(:tweet) { |n| "tweet_#{n}" }
  end
end