Rails.application.routes.draw do
  # Другие маршруты
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"

  # Главная страница
  root to: "home#index"

  # Обертка Devise в scope
  scope :users do
    devise_for :users, controllers: { registrations: 'registrations' }

    # Перенаправление залогиненных пользователей на страницу редактирования аккаунта
    authenticated :user do
       get 'client', to: 'clients#index', as: :authenticated_clients
    end

    # Перенаправление незалогиненных пользователей на страницу входа
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # Маршруты для других ресурсов
  resources :articles
  resources :products

  # Маршруты для клиентов
  resources :clients, only: [:index, :new, :create]
end