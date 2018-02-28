class AdminController < ApplicationController
	before_action :authenticate_user!
  def users
  	authorize! :manage, User
  	@users = User.order(:email)

  end

  def edit_users
  	authorize! :manage, User
  	user = User.find(params[:id])
  	user.update(role: params[:role])
  	redirect_to users_path

  end
end
