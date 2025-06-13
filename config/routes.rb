Rails.application.routes.draw do
  resources :estatiscas
  resources :clientes
  root "pecas#index"

  resources :usuarios, path: 'clientes'
  resources :pecas, path: "pecas"
  resources :sessoes, path: "sessoes"
  resources :areas
  resources :poltronas, path: "poltronas"
  resources :ingressos, path: "ingressos"
end
