class WorkEventsController < ApplicationController
  def index
    @work_events = WorkEvent.all
    @work_event = WorkEvent.new if current_user.admin?
  end
end
