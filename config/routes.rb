Rails.application.routes.draw do
  root "main#index"

  get 'menu' => 'access#menu'
  get 'login' => 'access#new'
  delete 'logout' => 'access#destroy'
  resource :access, controller: 'access', only: [:new, :create, :destroy] do
    member do
      get :menu
    end
  end

  match 'about', to: "main#about", via: :get

  resources :categories do
    member do
      get :delete
    end
  end

  resources :tasks do
    member do
      get :delete
    end
  end
end
