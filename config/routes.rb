PeaPatch::Application.routes.draw do
  
  get  '/auth/twitter',                    as: :sign_in
  get  '/auth/failure',                    to: 'sessions#failure'
  get  '/auth/:provider/callback',         to: 'sessions#create'
  post '/auth/:provider/callback',         to: 'sessions#create'
  get 'sign_out'                           to: 'sessions#destroy', as: :sign_out


end
