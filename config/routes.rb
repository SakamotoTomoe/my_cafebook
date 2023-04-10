Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  scope module: :public do
    resources :reviews, only: [:show, :new, :create, :edit, :update, :destroy]

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

end
