class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @activities = Activity.where(user_id: current_user.id)
  end

  def create
    @activity = Activity.new
  end
end
