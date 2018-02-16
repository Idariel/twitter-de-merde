class SendTweet
  def initialize
    # permet de passer le string en paramètre

  end

  def perform
    # exécute la tache

  end

  def log_in_to_twitter
    # se logue sur twitter avec mes identifiants
    @login = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret     = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token        = ENV['TWITTER_ACCESS_KEY']
      config.access_token_secret = ENV['TWITTER_ACCESS_SECRET']
    end
  end

  def send_tweet
    # envoie un tweet
    client.user do |object|
    case object
    when Twitter::Tweet
      puts "It's a tweet!"
    when Twitter::DirectMessage
      puts "It's a direct message!"
    when Twitter::Streaming::StallWarning
      warn "Falling behind!"
    end
  end


end
