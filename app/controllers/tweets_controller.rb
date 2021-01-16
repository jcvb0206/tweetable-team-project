class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[edit update destroy]

  def index
    @tweets = Tweet.all.select { |tweet| tweet.parent_id == nil }
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
    @tweets = @tweet.replies
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

  #def edit; end

  def update
    if @tweet.update(tweet_params)
      redirect_to root_path
    else
      render :edit, notice: @tweet.errors.full_messages.join(', ')
    end
  end

  def destroy
    @tweet.destroy
    redirect_to root_path
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body, :username, :name, :replies_count, :likes_count, :parent_id)
  end

  def set_tweet
    @tweet = current_user.tweets.find(params[:id])
  end
end
