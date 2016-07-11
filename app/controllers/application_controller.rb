class ApplicationController < ActionController::Base
  include SessionHelper
  protect_from_forgery with: :exception

  def not_found
    respond_to do |format|
      format.html { render file: "sessions/404", status: :not_found }
      format.xml { head :not_found }
      format.any { head :not_found }
    end
  end

  def restricted_access
    respond_to do |format|
      format.html { render file: "sessions/422", status: :not_found }
      format.xml { head :not_found }
      format.any { head :not_found }
    end
  end

  def authorized_admin?
    restricted_access unless admin?
  end

  def authorized_user?
    restricted_access unless logged_in?
  end

end