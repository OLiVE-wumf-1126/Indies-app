class FollowartistsController < ApplicationController
  def create
    followartist = Followartist.create(artist_id: params[:artistshow_id], listener_id: current_listener.id)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    followartist = Followartist.find_by(artist_id: params[:artistshow_id], listener_id: current_listener.id)
    followartist.destroy
    redirect_back(fallback_location: root_path)
  end
end
