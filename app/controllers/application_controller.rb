class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authorize

  def current_user
    case request.format
      when Mime::XML, Mime::ATOM, Mime::JSON
        if user = authenticate_with_http_basic { |u, p| User.authenticate(u, p) }
          @current_user = user
        end
      else
        @current_user ||= User.find(session[:user_id]) if session[:user_id]    
      end
  end

  helper_method :current_user

  def authorize
    case request.format
      when Mime::XML, Mime::ATOM, Mime::JSON
        authenticate_or_request_with_http_basic do |u, p| 
          @current_user ||= User.authenticate(u, p)
          @current_user
        end
        # if user = authenticate_with_http_basic { |u, p| User.authenticate(u, p) }
        #   @current_user = user
        # else
        #   request_http_basic_authentication
        # end
      else
        redirect_to '/login' unless current_user
      end
  end
end
