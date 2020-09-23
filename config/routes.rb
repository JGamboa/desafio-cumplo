Rails.application.routes.draw do
  root 'home#index'
  post '' => 'home#get_tmc'
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      post 'credits/get_tmc', to: "credits#get_tmc"
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
