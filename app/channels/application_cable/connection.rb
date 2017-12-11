module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_usuario

    def connect
      self.current_usuario = encontrar_usuario
    end

    protected

	    def encontrar_usuario
	      if (current_usuario = env['warden'].user)
	        current_usuario
	      else
	        reject_unauthorized_connection
	      end
	    end
  end
end