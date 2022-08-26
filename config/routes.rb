Rails.application.routes.draw do
  

    devise_for :users, skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
  
  devise_for :admin, skip: [:registrations, :passwords], controllers: {
  sessions: "admin/sessions"
}
  
  scope module: :public do
    root 'homes#top'
    get '/about' => 'homes#about', as: 'about'
   
  end
  
  namespace :public do
    get 'users/my_page' => 'users#show'
    get 'users/confirmation' => 'users#confirmation'
    patch 'withdraw' => 'users#withdraw'
    get 'search' => "searches#search"
    resources :users
    resources :stores do
      resources :articles
    end
    resources :articles do
      resource :likes, only: [:create, :destroy]
      resources :comments, only: [:create, :destroy]
    end
  end
  
  namespace :admin do
    get '/' => 'homes#top'
    get 'search' => "searches#search"
  end
  
  namespace :admin do
    resources :users
    resources :articles do
        resources :comments, only: [:create, :destroy]
    end
    resources :tags
  end
  
end
