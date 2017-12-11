class ConversacionChannel < ApplicationCable::Channel
  def subscribed
  	if current_usuario
    	stream_from "conversaciones-#{current_usuario.id}"
  	end
  end

  def unsubscribed
    stop_all_streams
  end

  def speak(data)
    message_params = data['mensaje'].each_with_object({}) do |el, hash|
      hash[el.values.first] = el.values.last
    end

    Mensaje.create(message_params)
  end
end