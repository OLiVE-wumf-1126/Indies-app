class FavoritesController < ApplicationController
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


end
