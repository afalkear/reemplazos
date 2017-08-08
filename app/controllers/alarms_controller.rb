class AlarmsController < ApplicationController
  before_action :authenticate_user!

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
                                  :responsible_id, 
                                  :activity_id)
  end
end
