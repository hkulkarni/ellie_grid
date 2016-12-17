Rails.application.routes.draw do
  root 'home#index'

  post '/create' => 'home#create'
  post '/send_reminders' => 'home#send_reminders'
end
