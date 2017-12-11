class ChatsController < ApplicationController
	before_action :authenticate_usuario!

	# GET /chats
  def index
    @usuarios = current_usuario.friends
    if session[:conversaciones]
    	@conversaciones = Conversacion.includes(:receptor, :mensajes).find(session[:conversaciones])
    end
  end
end
