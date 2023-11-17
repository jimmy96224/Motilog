Rails.application.routes.draw do

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
     resources :diaries, only: [:show]
    end
    resources :diaries, only: [:index]
    resources :post_comments, only: [:index, :edit, :update]
    # get 'search', to: 'searches#search'
  end

end