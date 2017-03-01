Rails.application.routes.draw do
  resources :choices
  resources :active_questions
  resources :active_questions
  resources :foreign_keys
  resources :foreign_keys
  resources :options
  resources :options
  resources :questions
  resources :inactive_survey
  resources :fullsurvey

  #get 'admin/index'

  #get 'sessions/new'

  get 'sessions/create'

  get 'sessions/destroy'

  resources :users

  get 'home' => 'home#index'
  get 'signup', to: 'users#new',as: 'signup'
  get 'login', to: 'sessions#new',as: 'login'
  get 'logout', to: 'sessions#destroy',as: 'logout'
  get 'admin' => 'admin#index'
  get 'home/survey' => 'home#survey'
  get 'home/completedsurvey' => 'home#completedsurvey'
  get 'home/profile' => 'home#profile'
  post 'createsurvey', to: 'fullsurvey#create'
  post 'madesurvey', to: 'home#madesurvey'
  get 'add' => 'home'
  post 'sign',  to: 'users#create'
#  match '/newsurvey', to:  'fullsurvey#new', via: 'get', as: :new_fullsurvey

  match '/fullsurvey', to:  'fullsurvey#index', via: 'get', as: :index_fullsurvey
  match '/createsurvey', to:  'home#createsurvey', via: 'get', as: :createsurvey_home
  match '/showsurvey', to:  'home#showsurvey', via: 'get', as: :showsurvey_home
  match '/adminshow', to:  'inactive_survey#adminshow', via: 'get', as: :adminshow_inactive_survey
  get 'inactive_surveys',to: 'inactive_survey#show'
  match '/create', to:  'inactive_survey#create', via: 'get', as: :create_inactive_survey
  #get 'create' => ''
  controller :sessions do
    get 'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end
  root 'admin#index'
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
