Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :admin do
    root to: "order#index"
    resources :items, only: [:new, :create, :index, :edit, :show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:index]
    resources :order_details, only: [:show]
  end

  namespace :public do
    root to: "homes#top"
    get 'home/about' => "homes#about",as: 'about'
    resources :items, only: [:index, :show]
    resources :customers, only: [:show, :edit, :update]
    resources :orders, only: [:index]
    resources :order_details, only: [:show]
    get 'shared/links', to: 'shared#links'
  end
  root to: "public/homes#top"
end

