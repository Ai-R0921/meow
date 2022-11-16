Rails.application.routes.draw do
  namespace :admin do
    get 'post_lost_cat_comments/index'
    get 'post_lost_cat_comments/destroy'
  end
  namespace :admin do
    get 'post_image_comments/index'
    get 'post_image_comments/destroy'
  end
  namespace :admin do
    get 'post_lost_cats/index'
    get 'post_lost_cats/show'
    get 'post_lost_cats/destroy'
  end
  namespace :admin do
    get 'post_images/index'
    get 'post_images/show'
    get 'post_images/destroy'
  end
  namespace :admin do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
  end
  namespace :admin do
    get 'types/create'
    get 'types/destroy'
    get 'types/index'
  end
  namespace :admin do
    get 'homes/top'
  end
  namespace :public do
    get 'relationships/create'
    get 'relationships/destroy'
  end
  namespace :public do
    get 'post_lost_cat_favorites/index'
    get 'post_lost_cat_favorites/create'
    get 'post_lost_cat_favorites/destroy'
  end
  namespace :public do
    get 'post_lost_cat_comments/create'
    get 'post_lost_cat_comments/destroy'
  end
  namespace :public do
    get 'post_lost_cats/new'
    get 'post_lost_cats/create'
    get 'post_lost_cats/index'
    get 'post_lost_cats/show'
    get 'post_lost_cats/edit'
    get 'post_lost_cats/update'
    get 'post_lost_cats/destroy'
  end
  namespace :public do
    get 'post_image_favorites/index'
    get 'post_image_favorites/create'
    get 'post_image_favorites/destroy'
  end
  namespace :public do
    get 'post_image_comments/create'
    get 'post_image_comments/destroy'
  end
  namespace :public do
    get 'post_images/new'
    get 'post_images/create'
    get 'post_images/index'
    get 'post_images/show'
    get 'post_images/edit'
    get 'post_images/update'
    get 'post_images/deatroy'
  end
  namespace :public do
    get 'users/show'
    get 'users/edit'
    get 'users/update'
    get 'users/unsubscribe'
    get 'users/withdraw'
  end
  namespace :public do
    get 'homes/top'
  end
  devise_for :admin, controllers: {
    sessions:"admin/sessions"
  }
  devise_for :users, controllers: {
    registrations:"public/registrations",
    sessions:"public/sessions"
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
