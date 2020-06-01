class Artist::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:artistname, :email, ])
    permit(:sign_in, keys: [:artistname, :email, ])
    permit(:account_update, keys: [:artistname, :email, :artistimage, :profile])
  end
end