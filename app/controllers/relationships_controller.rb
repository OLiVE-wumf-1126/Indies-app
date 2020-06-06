class RelationshipsController < ApplicationController
  before_action :set_listener

  def create
    following = current_listener.follow(@listener)
    if following.save
      flash[:success] = 'ユーザーをフォローしました'
      redirect_to listenershow_path(@listener)
    else
      flash.now[:alert] = 'ユーザーのフォローに失敗しました'
      redirect_to listenershow_path(@listener)
    end
  end

  def destroy
    following = current_listener.unfollow(@listener)
    if following.destroy
      flash[:success] = 'ユーザーのフォローを解除しました'
      redirect_to listenershow_path(@listener)
    else
      flash.now[:alert] = 'ユーザーのフォロー解除に失敗しました'
      redirect_to listenershow_path(@listener)
    end
  end

  private
  def set_listener
    @listener = Listener.find(params[:relationship][:follow_id])
  end
end
