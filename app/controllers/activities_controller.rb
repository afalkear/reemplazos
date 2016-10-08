class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @activities = Activity.where(user_id: current_user.id)
    @hours = default_hours
    @days = default_days
  end

  def create
    @activity = Activity.new
  end

  private

  def default_hours
    (8..20).to_a
  end

  def default_days
    #current_month.next_5_days
  end
end
