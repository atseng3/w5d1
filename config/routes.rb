MusicApp::Application.routes.draw do
  root :to => "bands#index"
  get '/users/activate' => 'users#activate'
  resources :users

  resource :session, :only => [:new, :create, :destroy]
  resources :bands do 
    resources :albums, :only => [:index, :new, :create]
  end
  resources :albums, :only => [:show, :edit, :update, :destroy] do 
    resources :tracks, :only => [:index, :new, :create]
  end
  resources :tracks, :only => [:show, :edit, :update, :destroy] do 
    resources :notes, :only => [:new, :create]
  end
  resources :notes, :only => [:show, :edit, :update, :destroy]
end
