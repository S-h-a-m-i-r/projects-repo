class ApplicationController < ActionController::Base
    helper_method :current_user
    def current_user
        # If session[:user_id] is nil, set it to nil, otherwise find the user by id.
        @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
    end
    def require_user
        redirect_to login_path, alert: 'You Must First Sign In' if current_user.nil?
     end
end
