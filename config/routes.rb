Rails.application.routes.draw do
	mount ActionCable.server => '/cable'
	root 'welcome#index'
  
  devise_for :usuarios
	resources :perfiles, only: [:show, :edit, :update]

	scope :amigos do
		get '/', to: 'amigos#index' 
		get 'mis_amigos', to: 'amigos#mis_amigos'
		post 'enviar_solicitud/:id', to: 'amigos#enviar_solicitud'
		post 'aceptar_solicitud/:id', to: 'amigos#aceptar_solicitud'
		post 'declinar_solicitud/:id', to: 'amigos#declinar_solicitud'
		post 'eliminar_amigo/:id', to: 'amigos#eliminar_amigo'
		post 'bloquear_amigo/:id', to: 'amigos#bloquear_amigo'
		post 'desbloquear_amigo/:id', to: 'amigos#desbloquear_amigo'
	end

	get 'chats', to: 'chats#index'
	
	resources :conversaciones, only: [:create] do
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
