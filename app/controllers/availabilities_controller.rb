class AvailabilitiesController < ApplicationController
  def index
  end

  def new
    @days = Date::DAYNAMES
    @time = []
    (0..24).step(1) {|x| @time << "#{format('%02d', x)}:00"}
  end
end
