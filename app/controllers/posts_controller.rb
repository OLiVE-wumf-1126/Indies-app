class PostsController < ApplicationController
  def index
    @posts = Post.includes(:artist).order("created_at DESC").page(params[:page]).per(6)
    @listener = current_listener
    @followartists = @listener.followartist_artists
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
    redirect_to root_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.delete
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:youtube_url, :text, :flyer).merge(artist_id: current_artist.id)
  end

end
