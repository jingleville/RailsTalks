Rails.application.routes.draw do
  
  devise_for :users

  resources :chats do
    resources :messages, only: %i[create]
  end
  resource :notifications, only: %i[create]
  
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      get 'chats', to: 'chats#index'
      post 'chats/:chat_id/messages', to: 'messages#create'
    end
  end

  root 'chats#index'
end


