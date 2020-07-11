Rails.application.routes.draw do

  #get 'tasks/index', to:'tasks#index'
  #get 'tasks/new', to: 'posts#new'

  root 'static_pages#top'
  get '/signup', to: 'users#new'
  
  get    '/login', to: 'sessions#new'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do #C4 ADD task Resouces
    resources :tasks
  end
end
