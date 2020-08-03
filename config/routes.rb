Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 首頁特化的寫法
  # root "pages#index"
  root "boards#index"
  # root "boards#index"
  # get "/", to: "pages#index"
  
  get "/about", to: "pages#about"

  # resources :boards do
  #   resource :posts, only: [:index, :new, :create]
  # end

  # resource :posts, except: [:index, :new, :create]

  resources :boards do
    resources :posts, shallow: true
  end

  # member & collection
  resources :users, only: [:create] do
    collection do
      get :sign_up # 表單 --> new --> create
      get :edit
      patch :update
      get :sign_in
      post :login
      delete :sign_out
    end
  end

end
