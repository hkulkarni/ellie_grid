class ReminderService

  def send_reminder
    send if after?(last_reminder) && after?(next_reminder) && after?(time_to_take)
  end

  private 

  def send
    medication = Medication.all.first
    medication.last_reminder = DateTime.now
    medication.next_reminder = time_to_take + 1.day
    medication.save
  end

  def medications
    Medication.all
  end

  def medication
    medications.first
  end

  def time_to_take
    medication.time.to_time
  end

  def last_reminder
    medication.last_reminder.to_time
  end

  def next_reminder
    medication.next_reminder.to_time
  end

  def after?(time)
    (DateTime.now.to_i - time.to_i) > 0
  end

end
