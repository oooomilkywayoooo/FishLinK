Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end


  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/' => 'public/homes#top'
  get '/about' => 'public/homes#about'

  scope module: :public do
    resources :reviews, only: [:index, :new, :create, :show, :destroy]
    resources :favorites, only: [:index]
    resources :posts do
      resources :comments, only: [:create, :destroy]
      resource :goods, only: [:create, :destroy]
      resource :favorites, only: [:create, :destroy]
    end
    resources :users, only: [:show, :edit, :update] do
      collection do
        get '/quit' => 'users#quit'
        patch '/out' => 'users#out'
      end
      resource :favorites, only: [:create, :destroy]
    end
  end

  namespace :admin do
    resources :posts, only: [:index, :show, :destroy]
    resources :reviews, only: [:index, :show, :destroy]
    resources :users, only: [:index, :show, :update]
  end
end
