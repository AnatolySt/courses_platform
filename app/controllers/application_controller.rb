class ApplicationController < ActionController::Base
  include CurrentUserConcern

  def authenticate_admin_user!
    check_auth
  end
end
