Rails.application.routes.draw do
  get 'category_config/index'
  get 'postdata/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index'
  # post 'home/index'
  post "home/index/", to: "home#create"
  patch "home/index/", to: "home#create"
  get 'home/history'
  post 'home/history'
  get "home/edit/:id", to: "home#edit"
  patch "home/edit/:id", to: "home#update"
  get "home/delete/:id", to: "home#delete"
  get "category/index", to: 'category_config#index'
end
