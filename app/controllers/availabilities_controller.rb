class AvailabilitiesController < ApplicationController
  def index
  end

  def new
    @days = Date::DAYNAMES
    @time_list = (7..22).inject([]) {|arr, n| arr << "#{format('%02d', n)}:00"}
  end
end
