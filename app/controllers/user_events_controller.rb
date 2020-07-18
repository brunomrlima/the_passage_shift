class UserEventsController < ApplicationController
  before_action :authenticate_user!
  before_action :destroy_access, only: :destroy

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

  def destroy
    if @user_event.destroy
      flash[:notice] = 'User removed successfully.'
    else
      flash[:alert] = 'Something went wrong please try again or contact the IT team.'
    end
    redirect_to work_events_path
  end

  private

    def user_event_params
      params.require(:user_event).permit(:work_event_id)
    end

    def destroy_access
      @user_event = UserEvent.find(params[:id])
      unless current_user.admin? || @user_event.user.eql?(current_user)
        flash[:alert] = "You can't do this action."
        redirect_to work_events_path
      end
    end
end
