Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 首頁特化的寫法
  root "pages#index"
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
end
