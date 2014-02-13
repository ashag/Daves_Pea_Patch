PeaPatch::Application.routes.draw do
  
  get  '/auth/twitter',                    as: :sign_in
  get  '/auth/failure',                    to: 'sessions#failure'
  get  '/auth/:provider/callback',         to: 'sessions#create'
  post '/auth/:provider/callback',         to: 'sessions#create'
  get 'sign_out',                          to: 'sessions#destroy', as: :sign_out


  get 'tool/checkout',                     to: 'tool_shed#new',    as: :checkout
  post 'tool/check_out',                    to: 'tool_shed#create'
  delete 'tool/check_in',                   to: 'tool_shed#destroy', as: :checkin


  get "posts/new"
  get "posts/edit"
  get "posts/update"
  get "posts/show"
  get "posts/destroy"
  root 'welcome#index'

  resources :tools
  resources :users




  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

end
