MusicApp::Application.routes.draw do
  resources :users, only: [:show, :new, :create]
  resource :session, only: [:new, :create, :destroy]
  resources :bands
  resources :albums
  resources :tracks
end
