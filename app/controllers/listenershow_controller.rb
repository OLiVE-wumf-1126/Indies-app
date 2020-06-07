class ListenershowController < ApplicationController
  def show
    @listener = Listener.find(params[:id])
    @followartists = @listener.followartist_artists
  end
end
