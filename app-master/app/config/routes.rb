Rails.application.routes.draw do
  get 'messages/create'
  # Другие маршруты
  get "/about", to: "pages#about", as: :about
  get "/contact", to: "pages#contact", as: :contact
  get '/messages', to: 'clients#chat'
  # Главная страница
  root to: "home#index"

  # Devise маршруты
  devise_for :users, controllers: { registrations: 'registrations' }

  # Перенаправление залогиненных пользователей на страницу редактирования аккаунта
  authenticated :user do
    get '/users/client', to: 'clients#index', as: :authenticated_clients
    resources :messages, only: [:create] # Добавьте эту строку для контроллера сообщений
  end

  # Перенаправление незалогиненных пользователей на страницу входа
  unauthenticated :user do
    root 'devise/sessions#new', as: :unauthenticated_root
  end

  # Маршруты для других ресурсов
  resources :articles
  resources :products

  # Маршруты для клиентов
resources :clients, only: [:index, :new, :create, :chat, :update, :delete, :destroy] do
  member do
    get 'edit'
	get 'update'
	match 'update', to: 'clients#destroy', via: :delete
   

  end
end
end