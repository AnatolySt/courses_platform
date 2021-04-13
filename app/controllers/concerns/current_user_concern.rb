module CurrentUserConcern
  def self.included(base)
    base.helper_method :current_user, :user_signed_in?
  end

  def current_user
    return @current_user if defined? @current_user

    @current_user = cookies.signed[:cd_auth_token].present? ? ::User.find_by(auth_token: cookies.signed[:cd_auth_token]) : nil
  end

  def user_signed_in?
    current_user.is_a?(::User)
  end

  def check_auth
    return true if user_signed_in?

    cookies[:redirect_after_login] = request.fullpath
    respond_to do |format|
      format.json { head :unauthorized }
      format.html { redirect_to new_session_path }
    end
  end

  def sign_in_user(user, remember = false)
    options = {
      value: user.auth_token,
      domain: :all,
      httponly: true
    }

    options[:expires] = 1.year.from_now if remember
    cookies.signed[:cd_auth_token] = options

    remove_instance_variable(:@current_user) if defined? @current_user
  end

  def sign_out_user
    cookies.delete :cd_auth_token, domain: :all
    remove_instance_variable(:@current_user) if defined? @current_user
  end
end