Rails.application.routes.draw do

devise_for :users, skip: :all
 devise_scope :user do
   get '/' => 'public/sessions#new', as: "root"
   post '/' => 'public/sessions#create'
   delete 'logout' => 'public/sessions#destroy'
   get 'signup' => 'public/registrations#new'
   post 'signup' => 'public/registrations#create'
 end

  devise_for :admins,skip: [:registrations,:passwords], controllers: {
    sessions: "admin/sessions"
  }

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
      
      resources :groups, except: [:index]
      get '/groups' => 'groups#index'

      resources :group_users, only: [:create, :destroy]


    end
  end



end