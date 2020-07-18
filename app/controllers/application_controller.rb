class Listener::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: %i[nickname email])
    permit(:account_update, keys: %i[nickname email profile])
  end
end
class Artist::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: %i[artistname email])
    permit(:account_update, keys: %i[artistname email artistimage profile])
  end
end
class ApplicationController < ActionController::Base
  before_action :set_search

  def devise_parameter_sanitizer
    if resource_class == Artist
      Artist::ParameterSanitizer.new(Artist, :artist, params)
    elsif resource_class == Listener
      Listener::ParameterSanitizer.new(Listener, :listener, params)
    else
      super
    end
  end

  def set_search
    @search = Post.ransack(params[:q])
    @search_posts = \
      @search.result(distinct: true).order(created_at: 'DESC').includes(:artist).page(params[:page]).per(9)
  end
end
