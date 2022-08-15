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
    resources :users
    resources :stores
    resources :articles do
      resource :likes, only: [:create, :destroy]
    end
  end
  
  namespace :admin do
    get '/' => 'homes#top'
  end
  
  namespace :admin do
    resources :users
    resources :articles
    resources :tags
  end
  
end
