Rails.application.routes.draw do
  root 'calculations#index'
  resources :calculations
end
