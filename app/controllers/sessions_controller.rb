class SessionsController < Devise::SessionsController
  def after_sign_in_path_for(_)
    landing_path
  end
end
