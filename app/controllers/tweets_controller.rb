class TweetsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @tweet = Tweet.where(user: current_user.id)
  end

end
