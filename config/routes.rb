Rails.application.routes.draw do

  resources :doctors, only: :show
  resources :doctor_patients, only: :destroy
  resources :patients, only: :index
end
