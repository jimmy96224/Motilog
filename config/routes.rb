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

      resources :instruments, except: [:index] do

        resources :maintenance_logs, except: [:show, :index]

      end



    end
  end



end