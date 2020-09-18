Rails.application.routes.draw do
  root 'home#index'
  post '' => 'home#get_tmc'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
