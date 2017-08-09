# Preview all emails at http://localhost:3000/rails/mailers/alarm_mailer
class AlarmMailerPreview < ActionMailer::Preview
  def send_alarm
    AlarmMailer.send_alarm(Activity.last)
  end
end
