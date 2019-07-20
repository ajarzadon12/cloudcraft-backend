Rails.application.routes.draw do
  post '/login' => 'users#login'
  post '/register' => 'users#register'
  get '/get_architecture_list' => 'user_architectures#get_architecture_list'
  get '/load_architecture' => 'user_architectures#load_architecture'
  post '/save_architecture' => 'user_architectures#save_architecture'
end
