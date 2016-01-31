Rails.application.routes.draw do
  devise_for :users
  resources :users
  resources :products
    get 'news/index' => 'news#index', as: :news
    get 'store' => 'store#index', as: :store

  get 'contact' => 'contact#index', as: :contact
    get 'products/edit' => 'products#edit'
    

    get 'about' => 'about#index', as: :about
    get 'landing_page' => 'static_pages#landing_page', as: :landing_page
  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
    root 'static_pages#landing_page'
    
    post 'static_pages/thank_you'
    resources :orders, only: [:index, :show, :create, :destroy]
    
    devise_for :users, :path => '', :path_names => {:sign_in => 'login', :sign_out => 'logout'}
    

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
