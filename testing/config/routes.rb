Rails.application.routes.draw do

  get 'index/create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

Testing::Application.routes.draw do
	root to: 'index#index'

	resource :short_urls, only: [:create, :new]

	get '/:short_url', to: 'short_urls#redirect'
end