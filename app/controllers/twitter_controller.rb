class TwitterController < ApplicationController
  def index
  end

  def tweet
		status = send_tweet.new(params).perform
		if status == true
			flash[:notice] = "Tweet envoyé !"
			redirect_to root_path
		else
			flash[:error] = "Tweet vide ... rien n'a été envoyé !"
			redirect_to twitter_path
		end
  end
end
