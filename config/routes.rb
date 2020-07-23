Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # 首頁特化的寫法
  root "pages#index"
  # get "/", to: "pages#index"
  
  get "/about", to: "pages#about"
end
