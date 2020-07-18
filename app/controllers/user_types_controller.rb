class UserTypesController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_access

  def index
    @admins = User.joins(:user_types).where(user_types: { :type_name => UserType::ADMIN }).order(:first_name)
    @regular_users = User.all.order(:first_name) - @admins
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

  private

    def admin_access
      unless current_user.admin?
        flash[:alert] = "You can't access this area."
        redirect_to root_path
      end
    end
end
