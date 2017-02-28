class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @schedule = @schedule || Schedule.new
    @activities = Activity.where(user_id: current_user.id)
    @hours = @schedule.hours
    @available_hours = @schedule.available_hours
    @days = @schedule.days
  end

  def create
    @activity = Activity.new
  end

  def add_hour
    schedule.hours << params[:hour] unless hours.include? params[:hour]
    hours << params[:hour] unless hours.include? params[:hour]
    flash[:notice] = "added hour: #{params[:hour]}"
    redirect_to activities_path(hours: hours.sort_by(&:to_i))
  end
end
