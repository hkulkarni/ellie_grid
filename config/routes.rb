Rails.application.routes.draw do
  root 'home#index'

  post '/create' => 'home#create'
  get '/read' => 'home#read'
  post '/update' => 'home#update'
  get '/send_reminders' => 'home#send_reminders'
end
