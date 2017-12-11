class AmigosController < ApplicationController
	before_action :set_usuario, except: [:index]

  # GET /amigos
  def index
  	@amigos = Usuario.all.where.not(id: current_usuario.id)
  end

  # GET /amigos/mis_amigos
  def mis_amigos
  	@amigos = current_usuario.friends
  end

  # POST /amigos/enviar_solicitud/:id
  def enviar_solicitud
  	current_usuario.friend_request(@amigo)
  	if @amigo.requested_friends.include?(current_usuario)
  		render json: "Solicitud Enviada"
  	else
  		render json: "Error al enviar la Solicitud"
  	end
  end

  # POST /amigos/aceptar_solicitud/:id
  def aceptar_solicitud
  	current_usuario.accept_request(@amigo)
    if current_usuario.friends.include?(@amigo)
      respond_to do |format|
        format.js
      end
    end
  end

  # POST /amigos/declinar_solicitud/:id
  def declinar_solicitud
  	current_usuario.decline_request(@amigo)
    if !current_usuario.requested_friends.include?(@amigo)
     respond_to do |format|
        format.js
      end
    end
  end

  # POST /amigos/eliminar_amigo/:id
  def eliminar_amigo
    current_usuario.remove_friend(@amigo)
    if !current_usuario.friends.include?(@amigo)
     respond_to do |format|
        format.js
      end
    end
  end

  # POST /amigos/bloquear_amigo/:id
  def bloquear_amigo
  	current_usuario.block_friend(@amigo)
    if current_usuario.blocked_friends.include?(@amigo)
      respond_to do |format|
        format.js
      end
    end
  end

  # POST /amigos/desbloquear_amigo/:id
  def desbloquear_amigo
    current_usuario.unblock_friend(@amigo)
    @amigo.friend_request(current_usuario)
    current_usuario.accept_request(@amigo)
    if !current_usuario.blocked_friends.include?(@amigo)
      respond_to do |format|
        format.js
      end
    end
  end

  private
  	def set_usuario
  		@amigo = Usuario.find(params[:id])
  	end
end
