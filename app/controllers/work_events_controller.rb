class WorkEventsController < ApplicationController
  before_action :authenticate_user!
  before_action :admin_access, only: [:create, :update, :edit, :destroy]
  before_action :set_work_event, only: [:edit, :update, :destroy, :show]

  def index
    @work_events = WorkEvent.all
    @work_event = WorkEvent.new if current_user.admin?
  end

  def create
    params[:replicate].present? ? replication = params[:replicate].to_i : replication = 0
    (0..replication).each do |increment|
      work_event = WorkEvent.new(work_event_params)
      work_event.start_time += increment.days
      work_event.end_time += increment.days
      if work_event.save
        flash[:notice] = "Work event successfully created."
      else
        flash[:alert] = 'Something went wrong. Try again or send us a message at thepassageshift@gmail.com'
      end
    end
    redirect_to work_events_path
  end

  def edit
  end

  def show
  end

  def update
    if @work_event.update(work_event_params)
      flash[:notice] = 'Work event successfully updated.'
    else
      flash[:alert] = 'Something went wrong please try again or contact the IT team.'
    end
    redirect_to work_events_path
  end

  def destroy
    if @work_event.destroy
      flash[:notice] = 'Work event successfully destroyed.'
    else
      flash[:alert] = 'Something went wrong please try again or contact the IT team.'
    end
    redirect_to work_events_path
  end

  def open_modal
    @work_event_modal = WorkEvent.find(params[:id])
    respond_to do |format|
      format.js
    end
  end

  def daily_summary
    @work_events = WorkEvent.where({start_time: DateTime.now.beginning_of_day..DateTime.now.end_of_day})
  end

  private

    def work_event_params
      params.require(:work_event).permit(:title, :description, :start_time, :end_time, :helpers_needed)
    end

    def admin_access
      unless current_user.admin?
        flash[:alert] = "You can't access this area."
        redirect_to root_path
      end
    end

    def set_work_event
      @work_event = WorkEvent.find(params[:id])
    end
end
