class AlarmsController < ApplicationController
  before_action :authenticate_user!

  def index
    @activity = Activity.find params[:activity_id]
    @alarms = Alarm.where(activity_id: params[:activity_id])
  end

  def new
    @alarm = Alarm.new
    @activity_id = params[:activity_id]
    @responsible_id = params[:responsible_id]
  end
  
  def create
    alarm = Alarm.new(alarm_params)
    alarm.user_id = current_user.id

    if alarm.save
      flash[:notice] = "Alarm successfully created"
    else
      flash[:alert] = "Alarm not created due to: #{alarm.errors.full_messages}"
    end

    redirect_to activities_path
  end

  def bulk_add
    resp = Alarm.bulk_add(
      current_user.id, 
      params[:alarm][:offset], 
      params[:alarm][:offset_type]
    )
    if resp[:success]
      flash[:notice] = "Alarms created"
    else
      flash[:alert] = "Alarms not created due to: #{resp[:errors]}"
    end

    redirect_to activities_path
  end

  def destroy
    alarm = Alarm.find params[:id]

    if alarm.destroy
      flash[:notice] = "Alarm successfully destroyed"
    else
      flash[:alert] = "Could not destroy alarm"
    end

    redirect_to activities_path
  end

  private
  def alarm_params
    params.require(:alarm).permit(:offset,
                                  :offset_type,
                                  :responsible_id, 
                                  :activity_id)
  end
end
