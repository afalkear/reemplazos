class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @activities = Activity.where(user_id: current_user.id)
    @activity = Activity.new
    @responsibles = Responsible.where(user_id: current_user.id)

    @first_day = @activities.empty? ? Date.today : @activities.order(:date).first.date
    @last_day = @activities.empty? ? Date.tomorrow : @activities.order(:date).last.date
    @days = @activities.empty? ? 0 : @activities.group(:date).count.count

  end

  def new
    @activity = Activity.new(activity_params)
    @responsibles = Responsible.where(user_id: current_user.id)
  end

  def create
    current_user.activities << Activity.new(activity_params)

    if current_user.activities.last.save
      flash[:notice] = "Activity successfully created"
    else
      flash[:alert] = "Activity could not be created due to: #{current_user.activities.last.errors.full_messages}"
    end

    redirect_to activities_path
  end

  def edit
    @activity = Activity.find(params[:id])
    @responsibles = Responsible.where(user_id: current_user.id)
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(activity_params)
      flash[:notice] = "Activity successfully updated"
    else
      flash[:alert] = "Activity could not be updated due to: #{@activity.errors.full_messages}"
    end

    redirect_to activities_path
  end

  def destroy
    activity = Activity.find(params[:id])
    
    if activity.destroy
      flash[:notice] = "Activiy successfully destroyed"
    else
      flash[:alert] = "Activity could not be destroyed"
    end
    
    respond_to do |format|
      format.json { render json: "destroyed" }
      format.html { redirect_to activities_path }
    end
  end

  private
  def activity_params
    params.require(:activity).permit(:name, :date, :start, :end, :responsible_id)
  end
end
