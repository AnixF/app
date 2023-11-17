Rails.application.routes.draw do
  # Другие маршруты
  get "/about", to: "pages#about"
  get "/contact", to: "pages#contact"

  # Главная страница
  root to: "home#index"

  # Обертка Devise в scope
  scope :users do
    devise_for :users

    # Перенаправление залогиненных пользователей на страницу редактирования аккаунта
    authenticated :user do
      root 'users/registrations#edit', as: :authenticated_root
    end

    # Перенаправление незалогиненных пользователей на страницу входа
    unauthenticated :user do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end

  # Маршруты для других ресурсов
  resources :articles
  resources :products
end