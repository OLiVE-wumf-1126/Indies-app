class CommentsController < ApplicationController
  before_action :listener_action

  def create
    comment = Comment.create(comment_params)
    redirect_back(fallback_location: root_path)
  end
  
  private
    def comment_params
      params.require(:comment).permit(:comment).merge(listener_id: current_listener.id, post_id: params[:post_id])
    end
    
    def listener_action
      redirect_back(fallback_location: root_path) unless listener_signed_in?
    end
end
