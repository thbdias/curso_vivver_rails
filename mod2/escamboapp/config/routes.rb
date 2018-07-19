Rails.application.routes.draw do
  namespace :site do
    get 'home', to: 'home#index' #mapeando o acesso
  end

  namespace :backoffice do
    get 'dashboard', to: 'dashboard#index' #mapeando o acesso
  end

  devise_for :admins
  devise_for :members  

  root 'site/home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
