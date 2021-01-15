class TweetsController < ApplicationController
  def index
    @tweets = Tweet.all
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
    @comment = @tweet.comments.new
  end

  def create
    @tweets = Tweet.all
    @tweet = current_user.tweets.create(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      redirect_to root_path, notice: @tweet.errors.full_messages.join(', ')
    end
  end

  def destroy; end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :username, :name)
  end

  def set_tweet
    @tweet = current_user.tweets.find(params[:id])
  end
end
