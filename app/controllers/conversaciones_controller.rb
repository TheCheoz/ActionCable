class ConversacionesController < ApplicationController

	# POST /conversaciones
  def create
    @conversacion = Conversacion.obtener(current_usuario.id, params[:usuario_id])
    
    session[:conversaciones] = []
    session[:conversaciones] << @conversacion.id

    respond_to do |format|
      format.js
    end
  end
end