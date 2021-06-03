class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!, except: [:index]

  before_action :set_q

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name]) 
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :user_image, :introduction])
  end

  def set_q
    @q = Room.ransack(params[:q])
  end

end
