class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameters_sanitizer.permit(:sign_up, key:[
      :email,
      :last_name,
      :last_name_kana,
      :first_name,
      :first_name_kana,
      :postal_code,
      :adress,
      :telephone_number,
      :is_deleted
    ])
    devise_parameters_sanitizer.permit(:sign_in, key: [:name])
  end
end
