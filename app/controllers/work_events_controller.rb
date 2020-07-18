class WorkEventsController < ApplicationController
  def index
    @work_events = WorkEvent.all
  end
end
