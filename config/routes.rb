PeaPatch::Application.routes.draw do

  get "posts/new"
  get "posts/edit"
  get "posts/update"
  get "posts/show"
  get "posts/destroy"
  root 'welcome#index'

end
