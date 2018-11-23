Rails.application.routes.draw do
  devise_for :students
  devise_for :company_users
  devise_for :teachers
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'frontpage#index'

end
