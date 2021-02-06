require 'rails_helper'

RSpec.describe Tweet, type: :model do
  let!(:tweet) { build(:tweet) }

  it 'tweetに値があれば保存できること' do
    expect(tweet).to be_valid
  end

  it 'tweetが空だと保存できないこと' do
    tweet.tweet = nil
    tweet.valid?
    expect(tweet.errors.full_messages).to include "Tweet can't be blank"
  end
end