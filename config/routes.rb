Rails.application.routes.draw do

# ゲストユーザーのルーティング
devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
end

# User側のルーティング
devise_for :users, skip: :all
 devise_scope :user do
   get '/' => 'public/sessions#new', as: "root"
   post '/' => 'public/sessions#create'
   delete 'logout' => 'public/sessions#destroy'
   get 'signup' => 'public/registrations#new'
   post 'signup' => 'public/registrations#create'
 end

  scope module: :public do

    resources :users, only: [:show, :edit, :update] do
      get '/cancel' => "users#cancel"
      patch '/close' => "users#close"
      get  '/logs' => "logs#index"

      resources :instruments, except: [:index] do
        resources :logs, except: [:show, :index]
      end

      resources :diaries, except: [:index] do
        resource :favorite, only: [:create, :destroy]
        resources :post_comments, only: [:create, :destroy]
        collection do
          get :search
        end
      end
      get '/diaries' => 'diaries#index'

    end
  end

# admin側のルーティング
devise_for :admins,skip: [:registrations,:passwords], controllers: {
    sessions: "admin/sessions"
  }
  namespace :admin do
    resources :users, only: [:index, :show, :update] do
    resource :post_comments, only: [:show]
     resources :diaries, only: [:show] do
       resources :post_comments, only: [:destroy]
     end
    end
    resources :diaries, only: [:index]
    resources :post_comments, only: [:index]
end
end