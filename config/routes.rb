Rails.application.routes.draw do


  #This allows the director to register users
  devise_for :users
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

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
