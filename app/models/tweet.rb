class Tweet < ApplicationRecord
  belongs_to :user
  belongs_to :twitter_account

  validates :body, length: { minimum: 1, maximum: 250 }
  validates :publish_at, presence: true

  after_initialize do
    self.publish_at ||= 1.hour.from_now
  end

  def published?
    tweet_id?
  end

  after_save_commit do
    if publish_at_previously_changed?
      TweetJob.set(wait_until: publish_at.in_time_zone("Asia/Kolkata").utc).perform_later(self)
    end
  end

  def publish_to_twitter!
    x_credentials = {
      api_key: Rails.application.credentials.dig(:twitter, :api_key),
      api_key_secret:  Rails.application.credentials.dig(:twitter, :api_secret),
      access_token: twitter_account.token,
      access_token_secret: twitter_account.secret
    }
    client = X::Client.new(**x_credentials)
    response = client.post("tweets", { text: body }.to_json)
    if response["data"]
      update!(tweet_id: response["data"]["id"])
      return { success: true, message: "Tweet posted successfully!", tweet_id: response["data"]["id"] }
    else
      raise "Error posting tweet: #{response}"
    end
  end
end
