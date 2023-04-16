Rails.application.routes.draw do
  devise_for :admins
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    resources :reviews, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  scope module: :public do
    resources :comments, only: [:create, :update, :destroy]
  end

  scope module: :public do
    resources :users, only: [:show, :edit, :update]
    get 'users/confirm' => 'users#confirm' , as: :users_canfirm
    patch 'users/my_page/cancel' => 'users#cancel' , as: :users_cancle
  end

  scope module: :public do
    root to: "homes#top"
  end

  namespace :admin do
    resources :reviews, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end

  namespace :admin do
    resources :comments, only: [:create, :update, :destroy, :index, :edit]
  end

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update]
  end

  namespace :admin do
    resources :keywords, only: [:index, :edit, :create, :update, :destroy]
  end
end
