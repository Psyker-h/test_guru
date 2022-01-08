class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def after_sign_in_path_for(resource)
    current_user.is_a?(Admin) ? admin_tests_path : (stored_location_for(resource) || root_path)
  end
end