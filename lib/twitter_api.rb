class TwitterApi
  def self.client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      # config.access_token        = "4501301836-lcmMm6YlzLFi5D7F1cOf5aA9jQtaJQ1Efu03Hz0"
      # config.access_token_secret =
    end
  end
end
