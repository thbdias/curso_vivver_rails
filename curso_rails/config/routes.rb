Rails.application.routes.draw do
  root 'home#index' #rota principal

  get 'home/index'

  resources :phones
  resources :addresses #, only [:new, :edit] # apenas rotas com ação 'new' e 'edit'
  resources :contacts #, except [:edit] #todas rotas exceto a edit
  resources :kinds # cria 8 rotas de forma automática

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
