Rails.application.routes.draw do
  get 'schedules/index'
  
  resources :schedules
end
