class ApplicationController < ActionController::Base
  require './lib/artist_parameter_sanitizer'
  protected
 
  def devise_parameter_sanitizer
    if resource_class == Artist
      Artist::ParameterSanitizer.new(Artist, :artist, params)
    elsif resource_class == Listener
      Listener::ParameterSanitizer.new(Listener, :Listener, params)
    end
  end
end
