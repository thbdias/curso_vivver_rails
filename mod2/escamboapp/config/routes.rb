Rails.application.routes.draw do
   
   get 'backoffice', to: 'backoffice/dashboard#index'
   
   namespace :backoffice do
      resources :categories, except: [:show, :destroy]
      resources :admins, except: [:show, :destroy]
      get 'dashboard', to: 'dashboard#index' #mapeando o acesso      
   end  

   namespace :site do
      get 'home', to: 'home#index' #mapeando o acesso
   end


   devise_for :admins, :skip => [:registrations]
   devise_for :members  

   root 'site/home#index'

   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
