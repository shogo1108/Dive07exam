class TweetsController < ApplicationController
  before_action :set_tweet, only:[:edit, :update, :destroy]
  def index
    @tweet = Tweet.new
    @tweets = Tweet.all
  end
  
  def create
    @tweet = Tweet.new(tweets_params)
  if @tweet.save
    redirect_to tweets_path, notice: "投稿しました！"
  else
    render action: "false"
  end
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)
    render action: "false" if @tweet.invalid?
  end
  
  def edit
  end
  
  def update
    @tweet.update(tweets_params)
    redirect_to tweets_path, notice: "修正しました！"
  end
  
  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice: "削除しました！"
  end
  
  private
    def tweets_params
      params.require(:tweet).permit(:content)
    end
    
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
end
