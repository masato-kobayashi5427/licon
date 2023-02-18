class UsersController < ApplicationController
  def show
    user = User.find(params[:id])
    episodes = Episode.where(user: user.id)
    render json: {user: user, episodes: episodes}
  end
end
