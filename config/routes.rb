Rails.application.routes.draw do
  root "busquedas#index"

  resources :busquedas do
    resources :resultados
  end
  
end
