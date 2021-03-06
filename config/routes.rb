PeaPatch::Application.routes.draw do
  
  get  '/auth/twitter',                    as: :sign_in
  get  '/auth/failure',                    to: 'sessions#failure'
  get  '/auth/:provider/callback',         to: 'sessions#create'
  post '/auth/:provider/callback',         to: 'sessions#create'

  get  'sign_out',                         to: 'sessions#destroy', as: :sign_out
  get  '/forecast',                        to: 'weather#forecast', as: :forecast
  get 'calendar',                          to: 'events#index'

  # get "posts/#{post.title}",               to: 'posts#show',       as: :show_post
  post 'posts',                            to: 'posts#subscribe',  as: :subscribe
  resources :posts
  #get "posts/new"
  #get "posts/edit"
  #get "posts/update"
  #get "posts/show"
  #get "posts/destroy"

  root 'welcome#index'

  resources :events
  resources :tools
  resources :users
  resources :user_tools, path: 'tool_shed', controller: 'tool_shed', path_names: { new: 'checkout', edit: 'checkin' }




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
