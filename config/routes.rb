Rails.application.routes.draw do
  resources :areas do
    member do
      get :poltronas_disponiveis
    end
  end

  resources :ingressos do
    collection do
      get :estatistica
    end
  end
  
  get 'ingressos/es'
  resources :clientes
  root "pecas#index"

  resources :usuarios, path: 'clientes'
  resources :pecas, path: "pecas"
  resources :sessoes, path: "sessoes"
  resources :poltronas, path: "poltronas"
  resources :ingressos, path: "ingressos"
end
