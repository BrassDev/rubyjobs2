Rubyjobs2::Application.routes.draw do
  resources :jobs
  
  #match '/about_us', :to => redirect('/') - changed as of Rails 4.0
  get 'about_us', :to => redirect('/')
  root :to => 'jobs#index'  
end
