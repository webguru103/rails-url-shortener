Rails.application.routes.draw do
  get 'urls/new'

  get 'urls/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Shortener::Application.routes.draw do
	resources :urls, only: [:new, :create]
	root to: 'urls#new'
end

Bitly.configure do |config|
	config.api_version = 3
	config.login = "webguru103"
	config.api_key = "R_9b398e9f2bd74c9ebf58548d8168284c"
end