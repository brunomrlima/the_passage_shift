class AvailabilitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_days_and_times, only: [:index, :new]

  def index
    @availabilities = current_user.availabilities
  end

  def new
  end

  def create
    params["availabilities"].each do |day, hours_arr|
      hours = hours_arr.join(",")
      availability = current_user.availabilities.new
      availability.day = day
      availability.hours = hours
      availability.save
    end
    flash[:notice] = "Hours saved!"
    redirect_to availabilities_path
  end

  def update_batch
    updating_days = params["availabilities"].keys
    Availability.delete_batch(current_user, updating_days)
    params["availabilities"].each do |day, hours_arr|
      hours = hours_arr.join(",")
      availability = Availability.find_or_create_by(user: current_user, day: day)
      availability.update(day: day, hours: hours)
    end
    flash[:notice] = "Hours updated!"
    redirect_to availabilities_path
  end

  private

    def set_days_and_times
      @days ||= Date::DAYNAMES
      @time_list ||= (7..22).inject([]) {|arr, n| arr << "#{format('%02d', n)}:00-#{format('%02d', n+1)}:00"}
    end
end
