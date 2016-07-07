Rails.application.routes.draw do
  resources :programas do
    resources :residencias
  end

  resources :apenados do
    get 'pauta', on: :collection
    post 'gerar_pauta', on: :collection
  end

  resources :setores

  resources :opos
  resources :users do
    member do
    get :change_password
    patch :do_change_password
    end
  end
  resources :unidades
  get 'dashboard/show'

  root to: 'dashboard#show'


  namespace :api, defaults: {format: 'json'} do
    namespace :v1 do
      resources :opos
      resources :apenados
      resources :programas
    end
  end


  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

end
