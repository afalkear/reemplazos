class AlarmMailer < ApplicationMailer
  def send_alarm(responsible, activity)
    default from: "soy.el.robot.sam@gmail.com"

    @responsible = responsible
    @activity = activity
    mail(to: @responsible.email, subject: "Reminder of your class")
  end
end
