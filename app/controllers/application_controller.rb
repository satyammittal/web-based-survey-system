class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authorize
  protected
  def authorize
    unless User.find_by(id:session[:user_id])
      redirect_to login_url,notice:"you trying to access without permission XD"
    end
  end
  def admin_user
      redirect_to(root_url) unless current_user.admin?
  end
  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless @user == current_user
  end
  def current_user
    User.where(id: session[:user_id]).first
  end
  helper_method :current_user
end
