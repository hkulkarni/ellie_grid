Rails.application.routes.draw do
  root 'home#index'

  post '/create' => 'medications#create'
  get '/read' => 'medications#read'
  post '/update' => 'medications#update'
  get '/send_reminders' => 'medications#send_reminders'
end
