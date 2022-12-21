class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    # def current_user
    #     return unless session[:user_id]
    #     @current_user ||= User.find(session[:user_id])
    # end
end
