Rails.application.routes.draw do
  root 'home#index'

  post '/send_reminders' => 'home#send_reminders'
end
