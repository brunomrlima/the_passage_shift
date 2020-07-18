class StaticPagesController < ApplicationController
  before_action :authenticate_user!

  def home
    if current_user.availabilities.none?
      redirect_to availabilities_path
    else
      redirect_to work_events_path
    end
  end
end
