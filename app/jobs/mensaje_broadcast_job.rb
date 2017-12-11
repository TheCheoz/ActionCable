class MensajeBroadcastJob < ApplicationJob
  queue_as :default

  def perform(mensaje)
    remitente = mensaje.usuario
    receptor = mensaje.conversacion.usuario_opuesto(remitente)

    broadcast_para_remitente(remitente, mensaje)
    broadcast_para_receptor(receptor, mensaje)
  end

  private

  def broadcast_para_remitente(usuario, mensaje)
    ActionCable.server.broadcast(
      "conversaciones-#{usuario.id}",
      mensaje: render_mensaje(mensaje, usuario),
      conversacion_id: mensaje.conversacion_id
    )
  end

  def broadcast_para_receptor(usuario, mensaje)
    ActionCable.server.broadcast(
      "conversaciones-#{usuario.id}",
      ventana: render_ventana(mensaje.conversacion, usuario),
      mensaje: render_mensaje(mensaje, usuario),
      usuario: mensaje.conversacion.usuario_opuesto(usuario).id,
      contenido: mensaje.cuerpo,
      conversacion_id: mensaje.conversacion_id
    )
  end

  def render_mensaje(mensaje, usuario)
    ApplicationController.render(
      partial: 'mensajes/mensaje',
      locals: { mensaje: mensaje, usuario: usuario }
    )
  end

  def render_ventana(conversacion, usuario)
    ApplicationController.render(
      partial: 'conversaciones/conversacion',
      locals: { conversacion: conversacion, usuario: usuario }
    )
  end
end