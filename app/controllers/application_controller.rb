class ApplicationController < ActionController::Base
  include ApplicationHelper

  protect_from_forgery with: :exception

  before_action :categories, :brands, :count_items
  before_action :configure_permitted_parameters, if: :devise_controller?

	def configure_permitted_parameters
	   devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
	   devise_parameter_sanitizer.permit(:account_update, keys: [:role])
	end

	rescue_from CanCan::AccessDenied do |exception|
	  respond_to do |format|
	    format.json { head :forbidden }
	    format.html { redirect_to main_app.root_url, :alert => "Not authorized in Admin area!" }
	  end	  
	end  

  def categories
  	@categories = Category.order(:name)
  end	

  def brands
  	@brands = Product.pluck(:brand).sort.uniq
  end	

  def count_items 
    @count = LineItem.count
  end

end
