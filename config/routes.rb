Rails.application.routes.draw do
  
  namespace :admin do
    get 'tags/index'
    get 'tags/show'
  end
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
    resources :users
    resources :stores
    resources :articles
  end
  
  namespace :admin do
    get '/' => 'homes#top'
  end
  
  namespace :admin do
    resources :users
    resources :articles
    resources :tags
  end
  
  namespace :public do
    get 'articles/new'
    get 'articles/show'
    get 'articles/index'
    get 'articles/edit'
  end
  namespace :public do
    get 'stores/new'
    get 'stores/edit'
    get 'stores/index'
    get 'stores/show'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/unsubscribe'
    get 'users/index'
  end
  namespace :public do
    get 'homes/top'
    get 'homes/about'
  end

end
