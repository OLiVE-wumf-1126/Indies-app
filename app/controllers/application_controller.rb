class Artist::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:artistname, :email, ])
    permit(:account_update, keys: [:artistname, :email, :artistimage, :profile])
  end
end
class ApplicationController < ActionController::Base
  def devise_parameter_sanitizer
    if resource_class == Artist
      Artist::ParameterSanitizer.new(Artist, :artist, params)
    elsif resource_class == Listener
      Listener::ParameterSanitizer.new(Listener, :Listener, params)
    else
      super
    end
  end
end
