class EmailsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_access

  def index
    @users = User.left_joins(:user_events).group(:id).order('COUNT(user_events.id) DESC')
  end

  def send_help
    user = User.find_by(id: params[:user_id])
    SendMailer.send_work_event_help(user.id).deliver_now
    flash[:notice] = "Help Email sent."
    redirect_to emails_path
  end

  def send_help_to_all
    User.find_each do |user|
      SendMailer.send_work_event_help(user.id).deliver_now
    end
    flash[:notice] = "Help Email was sent to all the users."
    redirect_to emails_path
  end

  private

    def admin_access
      unless current_user.admin?
        flash[:alert] = "You can't access this area."
        redirect_to root_path
      end
    end
end
