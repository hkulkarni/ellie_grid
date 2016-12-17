class HomeController < ApplicationController

  protect_from_forgery with: :null_session

  def index
  end

  def read
    medication = Medication.where(name: "Advil").first
    render :json => JSON.parse(medication.to_json)
  end

  def create
    Medication.create(name: "Advil", time: "5:00 pm", reminded_today: false)
    render status: 200, json: @controller.to_json
  end

  def send_reminders
    need_to_send = (now - when_to_take_meds) > 0
    puts "after time to take? #{need_to_send}"
    puts "already_sent_today? #{already_sent_today?}"
    puts "now: #{now}"
    puts "Sent out the reminders for #{when_to_take_meds}" if need_to_send && !already_sent_today?
    render status: 200, json: @controller.to_json
  end

  private 

  def user_service
    UserService.new
  end

  def when_to_take_meds
    user_service.get_medications[:time].to_time.seconds_since_midnight
  end

  def now
    Time.now.seconds_since_midnight
  end

  def already_sent_today?
    user_service.get_medications[:reminded_today]
  end

end