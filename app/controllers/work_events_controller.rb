class WorkEventsController < ApplicationController
  def index
    @work_events = WorkEvent.all
    @work_event = WorkEvent.new if current_user.admin?
  end

  def create
    @work_event = WorkEvent.new(work_event_params)
    if @work_event.save
      flash[:notice] = 'Work event successfully created.'
    else
      flash[:alert] = 'Something went wrong please try again or contact the IT team.'
    end
    redirect_to work_events_path
  end

  def edit
    @work_event = WorkEvent.find(params[:id])
  end

  def update
    @work_event = WorkEvent.find(params[:id])
    if @work_event.update(work_event_params)
      flash[:notice] = 'Work event successfully updated.'
    else
      flash[:alert] = 'Something went wrong please try again or contact the IT team.'
    end
    redirect_to work_events_path
  end

  private

    def work_event_params
      params.require(:work_event).permit(:title, :description, :start_time, :end_time)
    end
end
