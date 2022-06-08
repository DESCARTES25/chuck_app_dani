Rails.application.routes.draw do
  get 'categorium/new'
  get 'categorium/create'
  get 'categorium/index'
  get 'categorium/show'
  get 'categorium/edit'
  get 'categorium/update'
  get 'categorium/new'
  get 'categorium/create'
  root "busquedas#index"

  resources :busquedas do
    resources :resultados
  end
  
end
