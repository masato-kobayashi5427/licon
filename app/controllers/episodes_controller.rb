class EpisodesController < ApplicationController
  def index
    episodes = Episode.all
    render json: episodes.to_json(include: [:user, :orders])
  end

  def show
    episode = Episode.find(params[:id])
    render json: episode.to_json(include: :user)
  end

  def create
    @episode = Episode.new(episode_params)
    if params[:episode][:image][:data] != ""
      blob = ActiveStorage::Blob.create_after_upload!(
        io: StringIO.new(decode(params[:episode][:image][:data]) + "\n"),
        filename: params[:episode][:image][:name]
      )
      @episode.image.attach(blob)
      @episode["image_url"] = url_for(@episode.image)
    end
    if @episode.save
      render json: { status: :created, episode: @episode }
    else
      render json: { status: 500, errors: @episode.errors }
    end
  end

  def update
    episode = Episode.find(params[:id])
    episode.update(episode_params)
  end

  def destroy
    episode = Episode.find(params[:id])
    episode.destroy
  end

  private

  def episode_params
    params.require(:episode).permit(:title, :explain, :price, :category, :limit, :period, :image, :user_id)
  end

  def decode(str)
    Base64.decode64(str.split(',').last)
  end
  
end
