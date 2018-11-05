class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    #@padma_time_slots = Typhoeus.get("localhost:3004/api/v0/time_slots",
    #                                 params: {
    #                                  app_key: "zzz",
    #                                  account_name: "development",
    #                                  where: {
    #                                    padma_uid: "daniela.massa"
    #                                  }
    #                                  })
    #if @padma_time_slots.success?
    #  json = ActiveSupport::JSON.decode(@padma_time_slots.body)
    #  @padma_time_slots = json["collection"]
    #end

    @activities = Activity.where(user_id: current_user.id)
    @activity = Activity.new
    @responsibles = Responsible.where(user_id: current_user.id)
    @only_created = params[:only_created] || false

    @first_day = @activities.empty? ? Date.today : @activities.order(:date).first.date
    @last_day = if @activities.empty?
                  Date.tomorrow
                elsif @activities.order(:date).last.date >= @first_day + 7.days
                  @activities.order(:date).last.date
                else
                  @first_day + 7.days
                end
    @days = (@last_day - @first_day).to_i + 1
    @first_hour = 7 #if @activities.empty?
    #                7
    #              else
    #                @activities.order(:start_hour).first.start_hour
    #              end
    @last_hour = 21 #if @activities.empty?
                 #  21
                 #elsif @activities.order(:start_hour).last.start_hour - @first_hour < 10
                 #  @first_hour + 10
                 #else
                 #  @activities.order(:start_hour).last.start_hour
                 #end
    @hours = (@last_hour - @first_hour) + 1
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

  def delete_day
    activities = Activity.where(date: Date.new(params[:year].to_i, params[:month].to_i, params[:day].to_i))
    activities.destroy_all

    redirect_to activities_path
  end

  private
  def activity_params
    params.require(:activity).permit(:name, :date, :start_hour, :start_minutes, :end_hour, :end_minutes, :responsible_id, :confirmed)
  end
end
