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
    Medication.create(
        name: params[:name],
        time: params[:time],
        last_reminder: DateTime.now,
        next_reminder: DateTime.now
    )
    render status: 200, json: @controller.to_json
  end

  def send_reminders
    ReminderMailer.send_reminder(Medication.all.first).deliver_now
    ReminderService.new.update_reminder_record
    render status: 200, json: @controller.to_json
  end

end