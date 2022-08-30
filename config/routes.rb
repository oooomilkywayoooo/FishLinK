Rails.application.routes.draw do

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }


  devise_for :admin,skip: [:registrations, :passwords], controllers: {
    sessions: "admin/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/' => 'public/homes#top'
  get '/about' => 'public/homes#about'
  resources :posts
  resources :users, only: [:show, :edit, :update] do
    collection do
      get '/quit' => 'users#quit'
      patch '/out' => 'users#out'
    end
  end
end
