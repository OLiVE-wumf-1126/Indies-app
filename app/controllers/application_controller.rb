class Listener::ParameterSanitizer < Devise::ParameterSanitizer
  
  def initialize(*)
    super
    permit(:sign_up, keys: [:nickname, :email])
    permit(:account_update, keys: [:nickname, :email, :profile])
  end
end
class Artist::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:artistname, :email, ])
    permit(:account_update, keys: [:artistname, :email, :artistimage, :profile])
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
    @search = Post.ransack(params[:q]) #ransackの検索メソッド
    @search_posts = @search.result(distinct: true).order(created_at: "DESC").includes(:artist).page(params[:page]).per(5) # productsの検索結果一覧 
  end

end
