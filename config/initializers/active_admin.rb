ActiveAdmin.setup do |config|
  config.site_title = "Courses Platform"
  config.authentication_method = :authenticate_admin_user!

  # == Current User
  config.current_user_method = :current_user

  # == Logging Out
  config.logout_link_path = :session_path
  config.logout_link_method = :delete

  # == Batch Actions
  config.batch_actions = true

  # == Controller Filters
  config.filter_attributes = [:encrypted_password, :password, :password_confirmation]

  # == Localize Date/Time Format
  config.localize_format = :long
end
