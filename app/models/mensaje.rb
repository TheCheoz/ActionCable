class Mensaje < ApplicationRecord
	# --------------  CALLBACKS ------------------------------------------------------

	# Luego de crear un mensaje se ejecuta un Job que devuelve al receptor y al emiso el mensaje
  after_create_commit { MensajeBroadcastJob.perform_later(self) }

  # --------------  RELACIONES CON OTRAS TABLAS ------------------------------------

  belongs_to :usuario
  belongs_to :conversacion

  # --------------  VALIDACIONES ---------------------------------------------------

  validates :cuerpo, presence: true

end
