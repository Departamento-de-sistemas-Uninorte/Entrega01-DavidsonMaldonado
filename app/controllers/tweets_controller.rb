class TweetsController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweet = Tweet.where(user: current_user.id)
  end

  def new
    @tweet = Tweet.new
  end

  def show
    @tweet = Tweet.find(params[:id])
  end

  def create
      @tweet = Tweet.new(task_params)
      @tweet.user_id = current_user.id
      @tweet.user_name = current_user.user_name
      if @tweet.save
        redirect_to tweets_path, notice: "Tweet saved!"
      else
        flash.alert = "Tweet could not be saved."
        render :new
      end
  end

  def destroy
    @tweet = Tweet.find(params[:id])
    @tweet.destroy
    redirect_to tweets_path, notice: "Tweet destroyed!"
  end

  private
  def task_params
    params.require(:tweet).permit(:text)
  end

end
