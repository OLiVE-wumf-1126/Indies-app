class ListenershowController < ApplicationController
  def show
    @listener = Listener.find(params[:id])
    @followartists = @listener.followartists
  end
end
