Rails.application.routes.draw do

devise_for :users, skip: :all
 devise_scope :user do
   get '/' => 'public/sessions#new', as: "root"
   post '/' => 'public/sessions#create'
   delete 'logout' => 'public/sessions#destroy'
   get 'signup' => 'public/registrations#new'
   post 'signup' => 'public/registrations#create'
#   get 'user/edit' => 'public/registrations#edit'
#   patch 'user/edit' => 'public/registrations#update'
#   delete 'user/edit' => 'public/registrations#destroy'
 end
# 以下URI変更のためコメントアウト
  # devise_for :users,skip: [:passwords], controllers: {
  #   registrations: "public/registrations",
  #   sessions: "public/sessions"
  # }

  devise_for :admins,skip: [:registrations,:passwords], controllers: {
    sessions: "admin/sessions"
  }

  scope module: :public do
    resources :users, only: [:show, :edit, :update] do
      get '/cancel' => "users#cancel"
      patch '/close' => "users#close"

    resources :instruments, except: [:index]

    end
  end



end