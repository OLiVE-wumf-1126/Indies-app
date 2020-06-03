class ArtistshowController < ApplicationController
  def show
    @artist = Artist.find(params[:id])
    @posts = @artist.posts
  end
end
