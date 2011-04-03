# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  #令views能够调用各自的视图助手（helper）里的方法
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  helper_method :logged_in?, :current_user
  #开启反CSRF (Cross-Site Request Forgery)攻击保护
  #protect_from_forgery
  #过滤敏感字段
  filter_parameter_logging :password, :password_confirmation
  #发生错误时自动重定向页面
  rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found
  protected

  def record_not_found
    render :file => File.join(RAILS_ROOT, 'public', '404.html'), :status => 404
  end
  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end
