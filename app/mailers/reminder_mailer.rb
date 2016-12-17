class ReminderMailer < ApplicationMailer
  default :from => 'formudent.services@gmail.com'

  def send_reminder(medication)
    @medication = medication
    mail( :to => "herschel.kulkarni@gmail.com", :subject => "Reminder to take your medication!" )
  end

end


