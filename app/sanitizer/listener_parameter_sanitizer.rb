class Listener::ParameterSanitizer < Devise::ParameterSanitizer
  
  def initialize(*)
    super
    permit(:sign_up, keys: [:nickname, :email])
    permit(:account_update, keys: [:nickname, :email, :profile])
  end
end