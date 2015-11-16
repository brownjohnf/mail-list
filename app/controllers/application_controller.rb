class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def default
  end

  def after_sign_in_path_for(resource)
    if params[:redirect]
      "%s?token=%s" % [params[:redirect], cookies[:_nw_auth_session]]
    else
      super
    end
  end
end
