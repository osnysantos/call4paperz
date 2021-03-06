Rr10Team71::Application.routes.draw do
  match '/auth/:provider/callback' => 'authentications#create'
  match '/auth/failure' => 'authentications#failure'

  devise_for :users, :controllers => {:registrations => :registrations}

  resources :comments
  resource :profile

  resources :events do
    member do
      get :crop
    end

    resource :close, only: [:edit, :update], controller: "event_close"

    resources :proposals do
      member do
        get :like
        get :dislike
      end
    end
  end

  root :to => "home#index"

end
