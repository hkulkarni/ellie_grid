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
    need_to_send = (now - when_to_take_meds) > 0
    puts "after time to take? #{need_to_send}"
    puts "already_sent_today? #{already_sent_today?}"
    puts "now: #{now}"
    send_reminder if need_to_send && !already_sent_today?
    render status: 200, json: @controller.to_json
  end

  private 

  def send_reminder
    puts "Sent out the reminders for #{when_to_take_meds}"
  end

  def medications
    Medication.all
  end

  def medication
    medications.first
  end

  def when_to_take_meds
    medication.time.to_time.seconds_since_midnight
  end

  def now
    Time.now.seconds_since_midnight
  end

  def already_sent_today?
    medication.reminded_today
  end

end