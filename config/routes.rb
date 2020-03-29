Rails.application.routes.draw do
<<<<<<< HEAD
    get 'students/index'
    get 'students/new'
    get 'students/show'
    get 'papers/index'
    get 'papers/add'
    
    devise_for :users
=======
  devise_for :users
>>>>>>> a1a5f7b2d172d5aad6dfed206883a8443e0dade4
    # get 'papers/index'
    # get 'papers/add'
    # The priority is based upon order of creation: first created -> highest priority.
    # See how all your routes lay out with "rake routes".
    # You can have the root of your site routed with "root"
    
    get 'welcome/index', to: "welcome#index", as: "index"
    #get 'welcome/student', to: "welcome#student", as: "student"
    get 'welcome/professor', to: "welcome#professor", as: "professor"
    #get 'papers/index', to: "papers#index", as: "paper"
    root 'welcome#index'

    # Example of regular route:
    #   get 'products/:id' => 'catalog#view'
    
    # Example of named route that can be invoked with purchase_url(id: product.id)
    #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
    
    # Example resource route (maps HTTP verbs to controller actions automatically):
    # resources :products

    resources :students
    resources :papers
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
