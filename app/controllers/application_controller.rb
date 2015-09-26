class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!, except: [:recover, :do_recover]
  before_action :is_user_active
  
  private
    def is_user_active
      Rails.logger.info "#####################################################"
      Rails.logger.info "#####################################################"
      Rails.logger.info "#####################################################"
      Rails.logger.info "aca va el path"
      Rails.logger.info params[:controller]
      
      Rails.logger.info "#####################################################"
      Rails.logger.info "#####################################################"
      Rails.logger.info "#####################################################"
      unless params[:controller] == 'devise/sessions' or params[:controller] == 'users'
        if user_signed_in? and !current_user.try(:active)
          sign_out current_user
          redirect_to :new_user_session
        end
      end
    end
end
