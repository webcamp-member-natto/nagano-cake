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

 root to: 'homes#top'
  get 'about'=>"homes#about",as: "about"

  namespace :admin do
    resources :genres
    resources :items
  end

  namespace :public do
    resources :items
    resources :cart_items
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: "destroy_all"
  end


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
