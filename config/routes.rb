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
    resources :rooms, only: [:create, :show]
    resources :users, only: [:edit, :update, :show] do
      resources :messages, only: [:create, :index]
      member do
        get :favorites
      end
      resource :relationships, only: [:create, :destroy]
      get "followings" => "relationships#followings", as: "followings"
      get "followers" => "relationships#followers", as: "followers"
    end
    resources :post_images do
      get :search, on: :collection
      get :confirm, on: :collection
      resource :post_image_favorites, only: [:create, :destroy]
      resources :post_image_comments, only: [:create, :destroy]
    end

    resources :post_lost_cats do
      resource :post_lost_cat_favorites, only: [:create, :destroy]
      resources :post_lost_cat_comments, only: [:create, :destroy]
    end

    # get 'messages/:id' => 'messages#show', as: 'message'
    # resources :messages, only: [:create]
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
