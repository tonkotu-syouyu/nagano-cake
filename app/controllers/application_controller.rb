class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?

private

def
after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :customer
        new_customer_session_path
    elsif resource_or_scope == :admin
        new_admin_session_path
    else
        root_path
    end
end
  # helper_method :current_cart

  # def current_cart
  #   if session[:cart_product_id]
  #     @cart_product = CartProduct.find(session[:cart_product_id])
  #   else
  #     @cart_product = CartProduct.create
  #     session[:cart_product_id] = @cart_product.id
  #   end
  # end


  # protected



  # def configure_permitted_parameters
    # devise_parameter_sanitizer.permit(:sign_up, keys:[:email, :last_name, :last_name_kana, :first_name, :first_name_kana, :postal_code, :address, :telephone_number, :is_deleted])
    # devise_parameters_sanitizer.permit(:sign_in, keys: [:name])

  # end

end
