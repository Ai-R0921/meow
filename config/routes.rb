Rails.application.routes.draw do

  devise_for :admin, controllers: {
    sessions:"admin/sessions"
  }
  devise_for :users, controllers: {
    registrations:"public/registrations",
    sessions:"public/sessions"
  }

  get "users/my_page", to: "public/users#my_page", as:"my_page"
  get "users/infomation/edit", to: "public/users#edit", as:"edit_user"


  scope module: "public" do
    root to: "homes#top"
    get "users/unsubscribe"
    patch "users/withdraw"
    resources :users, only: [:edit, :update, :show]
    resources :post_images
    resources :post_lost_cats
    resources :post_image_comments, only: [:create, :destroy]
    resources :post_lost_cat_comments, only: [:create, :destroy]
    resources :post_image_favorites, only: [:index, :create, :destroy]
    resources :post_lost_cat_favorites, only: [:index, :create, :destroy]
    resources :relationships, only: [:create, :destroy]
  end

  namespace :admin do
    get "/" => "homes#top", as: "top"
    resources :users, only: [:show, :edit, :update]
    resources :types, only: [:index, :new, :create, :destroy]
    resources :post_images, only: [:index, :show, :destroy]
    resources :post_lost_cats, only: [:index, :show, :destroy]
    resources :post_image_comments, only: [:index, :destroy]
    resources :post_lost_cat_comments, only: [:index, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
