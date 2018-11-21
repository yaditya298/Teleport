Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  post 'generate_number' => 'contacts#generate'
  get  'request_number'  => 'contacts#request_number'
  post 'check_number'    => 'contacts#check_number'
  root to: 'contacts#new'
end
