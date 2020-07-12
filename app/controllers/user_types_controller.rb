class UserTypesController < ApplicationController
  def index
    @users = User.all
  end

  def grant_admin
    user = User.find_by(id: params[:user_id])
    user.user_types.create(type_name: UserType::ADMIN)
    flash[:notice] = "#{user.first_name} is now an admin."
    redirect_to user_types_path
  end

  def revoke_admin
    user = User.find_by(id: params[:user_id])
    user_type = user.user_types.where(type_name: UserType::ADMIN).last
    user_type.destroy
    flash[:notice] = "#{user.first_name} is not an admin anymore."
    redirect_to user_types_path
  end
end
