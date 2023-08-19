Rails.application.routes.draw do
  root "cargos#index"
  resources :cargos
end
