class AlarmMailer < ApplicationMailer
  default from: "soy.el.robot.sam@gmail.com"

  def send_alarm(activity)
    
    @user = User.find activity.user_id
    @responsible = Responsible.find activity.responsible_id
    @activity = activity
    mail(to: @responsible.email, subject: "Reminder of your class")
  end
end
