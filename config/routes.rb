Rails.application.routes.draw do
  # 顧客用
  # URL /customers/sign_in ...
devise_for :customers, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

  # 管理者用
  # URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}

  namespace :admin do
    resources :genres
  end

  root to: 'homes#top'
  get 'about'=>"homes#about",as: "about"

  namespace :admin do
    resources :items
  end

  namespace :public do
    get 'items/index'
    get 'items/show'
  end

  namespace :public do
    resources :orders
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
