class HomeController < ApplicationController

  protect_from_forgery with: :null_session

  def index
  end

  def read
    render :json => JSON.parse(medications.to_json)
  end

  def update
    medication = Medication.find_by(id: params[:id])
    medication.name = params[:name]
    medication.time = params[:time]
    render status: 200, json: @controller.to_json if medication.save
  end

  def create
    Medication.create(name: params[:name], time: params[:time], reminded_today: false)
    render status: 200, json: @controller.to_json
  end

  def send_reminders
    puts "after last reminder: #{after?(last_reminder)}"
    puts "after next reminder: #{after?(next_reminder)}"
    puts "after time to take: #{after?(time_to_take)}"
    send_reminder if after?(last_reminder) && after?(next_reminder) && after?(time_to_take)
    render status: 200, json: @controller.to_json
  end

  private 

  def send_reminder
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