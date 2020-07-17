class FavoritesController < ApplicationController
  before_action :listener_action

  def create
    favorite = current_listener.favorites.build(post_id: params[:post_id])
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite = Favorite.find_by(post_id: params[:post_id], listener_id: current_listener.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def listener_action
    redirect_back(fallback_location: root_path) unless listener_signed_in?
  end
end
