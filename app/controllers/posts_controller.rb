class PostsController < ApplicationController
  def index
    @posts = Post.includes(:artist).order("created_at DESC").page(params[:page]).per(6)
    @listener = current_listener
    if listener_signed_in?
      @followartists = @listener.followartist_artists
      @favorite_posts = @listener.favorite_posts
    end
    
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
    @comments = @post.comments.includes(:listener)
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

  def favoritesindex
    @favorites = current_listener.favorite_posts.order("created_at DESC").page(params[:page]).per(6)
    @listener = current_listener
    if listener_signed_in?
      @followartists = @listener.followartist_artists
      @favorite_posts = @listener.favorite_posts
    end
  end

  private
  def post_params
    params.require(:post).permit(:youtube_url, :text, :title, :tag_list).merge(artist_id: current_artist.id)
  end

end
