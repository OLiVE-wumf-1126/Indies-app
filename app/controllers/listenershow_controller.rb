class ListenershowController < ApplicationController
  def show
    @listener = Listener.find(params[:id])
  end
end
