Rails.application.routes.draw do
  get '/dojos/new'  => "dojos#show_create_page"
  get '/dojos'  => "dojos#index"
  get 'dojos/:id' => "students#index"
  get 'dojos/:id/students/new'   => "students#new"
  get  '/dojos/:dojo_id/students/:id/edit'=> 'students#edit'
  get '/dojos/:id/edit'=> "dojos#show_edit_page"
  post '/create' => "dojos#create"
  patch '/dojos/:dojo_id/students/:id' => 'students#update'

  get 'dojos/:id/students' =>"students#index"
  
  get '/dojos/:dojo_id/students/:id' => 'students#show'
  delete '/dojos/:id' => "dojos#destroy"
  
  delete '/dojos/:dojo_id/students/:id' => "students#destroy"
  post 'create_student' => "students#create"
  patch '/update/:id' => "dojos#update"
end
