Rails.application.routes.draw do
  resources :contracts
  resources :my_profile
  resources :companies
  resources :tests
  resources :internship_coaches
  resources :project_timeline
  resources :students
  resources :task
  resources :events


  devise_for :students,              
  :controllers => { :registrations => 'users/registrations' },
  path: '', 
             path_names: 
             {
               sign_in: 'login', 
               sign_out: 'logout', 
               sign_up: 'register',
               confirmation:  'confirmation' 

            }
  
  devise_for :company_users,
  :controllers => { :registrations => 'company_users/registrations' }


  devise_for :teachers
    
  resources :students, :only => [:create, :destroy] do
    resources :events
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'frontpage#index'
  get '/student_dashboard' => 'student_dashboard#index'


  get '/my_profile' => 'my_profile#index'

  patch '/my_profile/update' => 'my_profile#update'

  get '/my_profile/success' => 'my_profile#success'
  get '/my_profile/error' => 'my_profile#error'

  get '/contracts/success' => 'contracts#success'
  get '/contracts/error' => 'contracts#error'

  get '/redirect', to: 'meetings#redirect', as: 'redirect'
  get '/callback', to: 'meetings#callback', as: 'callback'
  get '/calendars', to: 'meetings#calendars', as: 'calendars'
  #get '/events/:calendar_id', to: 'meetings#events', as: 'events', calendar_id: /[^\/]+/

  #post '/events/:calendar_id', to: 'meetings#new_event', as: 'new_event', calendar_id: /[^\/]+/

get '/meetings' => 'meetings#index'
 
end
