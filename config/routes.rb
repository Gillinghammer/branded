Rails.application.routes.draw do
  root 'home#index'
  resources :companies
  resources :searches
  resources :lookups
  get 'lookups/find/:email' => 'lookups#find_person', :email => /.*/
  get "/404" => "errors#not_found"
  get "/500" => "errors#exception"

  devise_for :users, :controllers => {:registrations => "users"}
  devise_scope :user do
      get 'login' => 'devise/sessions#new'
      get 'logout' => 'devise/sessions#destroy'
      match 'users/:id', to: 'users#show', via: 'get'
    end
      

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  # resources :searches

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
