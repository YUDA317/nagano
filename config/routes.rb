Rails.application.routes.draw do
  devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :customers, only: [:index, :show, :edit, :update]
  
  Rails.application.routes.draw do
    namespace :public do
      root to: "homes#top"
      get 'home/about' => "homes#about",as: 'about'
      resources :items, only: [:index, :show]
    end
  end

end
