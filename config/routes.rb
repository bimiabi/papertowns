Rails.application.routes.draw do


  #This allows the director to register users
  devise_for :users#, :skip => [:registrations]
  devise_scope :user do
  get "signup",   :to => "users#new"
  get "signin",   :to => "devise/sessions#new"
  get "signout",  :to => "devise/sessions#destroy"
  get "cancel_user_registration", :to => "devise/registrations#cancel"
  post "user_registration",       :to => "users#create"
  get "new_user_registration",    :to => "users#new"
  get "edit_user_registration",   :to => "users#edit"
  end

  resources :users
  resources :purchases
  resources :appointments do
    resources :comments
  end
  resources :customers
  resources :products

  root 'airdb#home'

  get 'airdb/home'
  get '/weeklyAppointments', to: 'appointments#weeklyAppointments'
  get '/dailyAppointments', to: 'appointments#dailyAppointments'
  get '/allAppointments', to: 'appointments#allAppointments'
  get '/finishedAppointments', to: 'appointments#finishedAppointments'
  get '/pendingAppointments', to: 'appointments#pendingAppointments'
  get '/appointmentsForTomorrow', to: 'appointments#appointmentsForTomorrow'


end
