Rails.application.routes.draw do

  root 'home#index'

  get '/about' => 'home#about'
  #get 'home/index'

  #post '/search' => 'home#word'

  resources :upload do
      collection { post :upload_dictionary }
    end

  resources :anagram do
      collection { post :check_word }
  end
end
