Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'pages#home' 
  get '/challenges' => 'challenges#index'
  get '/challenges/new' => 'challenges#new'
  post '/challenges' => 'challenges#create'
  get '/challenges/:id' => 'challenges#show'
  get '/challenges/:id/edit' => 'challenges#edit'
  patch '/challenges/:id' => 'challenges#update'
  delete '/challenges/:id' => 'challenges#destroy'


  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/user_challenges' => 'user_challenges#index'
  get '/user_challenges/:id' => 'user_challenges#show'
  get '/user_challenges/new' => 'user_challenges#new'
  post '/user_challenges' => 'user_challenges#create'
  get '/user_challenges/:id/edit' => 'user_challenges#edit'
  patch '/user_challenges/:id' => 'user_challenges#update'
  delete '/user_challenges/:id' => 'user_challenges#destroy'

  get '/users' => 'users#index'
  get '/users/:id' => 'users#show'
  get '/users/new' => 'users#new'
  post '/users' => 'users#create'
  get '/users/:id/edit' => 'users#edit'
  patch '/users/:id' => 'users#update'
  delete '/users/:id' => 'users#destroy'

  get '/signup' => 'users#new'

  namespace :api do 
    namespace :v1 do
      get '/challenges' => 'challenges#index'
    end
  end

end
