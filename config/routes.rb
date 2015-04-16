MusicApp::Application.routes.draw do
  resources :users, only: [:show, :new, :create]
  resource :session, only: [:create, :destroy]

end
