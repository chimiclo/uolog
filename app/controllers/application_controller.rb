class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  def after_sign_out_path_for(resource_or_scope)
    home_index_path
  end
end
