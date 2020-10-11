class ApplicationController < ActionController::Base
  private

  def after_sign_in_path_for(_admin)
    current_user.is_a?(Admin) ? admin_path : root_path
  end
end
