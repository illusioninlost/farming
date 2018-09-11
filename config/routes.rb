Rails.application.routes.draw do
  resources :comments
  resources :farmers
  resources :items
  get 'welcome/index'
  get '/mission', to: 'welcome#mission'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post '/login', to: 'farmers#log_in', as: 'log_in'
  get '/logout', to: 'farmers#log_out', as: 'log_out'
  post '/items/:id/add', to: 'items#add'
end
