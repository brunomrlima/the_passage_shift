class EmailsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_access

  def index
    @users = User.all
  end

  private

    def admin_access
      unless current_user.admin?
        flash[:alert] = "You can't access this area."
        redirect_to root_path
      end
    end
end
