class ArtistshowController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
    @posts = @artist.posts.order("created_at DESC").page(params[:page]).per(1)
  end
end
