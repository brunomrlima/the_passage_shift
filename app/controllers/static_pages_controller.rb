class StaticPagesController < ApplicationController
  include RanksHelper
  before_action :authenticate_user!

  def home
    if current_user.availabilities.none?
      redirect_to availabilities_path
    else
      redirect_to work_events_path
    end
  end

  def rank
    @users = User.fetch_and_order_users_by_user_events
  end
end
