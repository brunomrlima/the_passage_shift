class UserEventsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_access

  def create
    @user_event = UserEvent.new(user_event_params)
    @user_event.user = current_user
    if @user_event.save
      flash[:notice] = 'You sucessfully joined our work event.'
    else
      flash[:alert] = 'Something went wrong please try again or contact the IT team.'
    end
    redirect_to work_events_path
  end

  private

    def user_event_params
      params.require(:user_event).permit(:work_event_id)
    end

    def admin_access
      unless current_user.admin?
        flash[:alert] = "You can't access this area."
        redirect_to root_path
      end
    end
end
