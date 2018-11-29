Rails.application.routes.draw do
  resources :contracts
  resources :my_profile
  resources :companies
  resources :tests
  resources :internship_coaches
  devise_for :students
  devise_for :company_users
  devise_for :teachers
  resources :students


  #devise_for :students, controllers: { registrations: 'users/registrations' }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'frontpage#index'
  get '/student_dashboard' => 'student_dashboard#index'


  get '/my_profile' => 'my_profile#index'

  patch '/my_profile/update' => 'my_profile#update'

  get '/my_profile/success' => 'my_profile#success'
  get '/my_profile/error' => 'my_profile#error'

  get '/contracts/success' => 'contracts#success'
  get '/contracts/error' => 'contracts#error'


 
end
