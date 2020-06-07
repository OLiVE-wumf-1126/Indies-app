class ListenershowController < ApplicationController
  def show
    @listener = Listener.find(params[:id])
    @followartists = @listener.followartist_artists
    @favorite_posts = @listener.favorite_posts
  end
end
