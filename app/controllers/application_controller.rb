class ApplicationController < ActionController::Base

  # include UsersHelper

  rescue_from ActiveRecord::RecordNotFound, with: :not_found

  # before_action :find_user

  # 放在 controller 給 view 用
  helper_method :user_signed_in?, :current_user

  private
  # def find_user
  #   if session[:user_token]
  #     # session[:user_token] => return user.id
  #     @current_user = User.find(session[:user_token])
  #   end
  # end

  def not_found
    render file: '/public/404.html', status: 404
  end

  # for controller to helper
  # 下面這手法很常用
  def user_signed_in?
    current_user != nil
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_token])
  end
end
