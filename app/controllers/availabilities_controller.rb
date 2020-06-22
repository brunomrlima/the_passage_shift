class AvailabilitiesController < ApplicationController
  def index
  end

  def new
    @days = Date::DAYNAMES
  end
end
