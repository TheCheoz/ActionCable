class Conversacion < ApplicationRecord
	# --------------  TABLA HA UTILIZAR ----------------------------------------------

	self.table_name = :conversaciones

  # --------------  RELACIONES CON OTRAS TABLAS ------------------------------------

	has_many :mensajes, dependent: :destroy
  belongs_to :remitente, foreign_key: :remitente_id, class_name: Usuario
  belongs_to :receptor, foreign_key: :receptor_id, class_name: Usuario

  # --------------  VALIDACIONES ---------------------------------------------------

  validates :remitente_id, uniqueness: { scope: :receptor_id }

  # --------------  SCOPES ---------------------------------------------------------

  # Conversación entre dos usuarios
  scope :entre, -> (remitente_id, receptor_id) do
    where(remitente_id: remitente_id, receptor_id: receptor_id).or(
      where(remitente_id: receptor_id, receptor_id: remitente_id)
    )
  end

  # Conversaciones de un usuario 
  scope :de, -> (usuario_id) do
    where(remitente_id: usuario_id).or(where(receptor_id: usuario_id))
  end

  # Obtiene la conversación entre dos usuarios o la crea
  def self.obtener(remitente_id, receptor_id)
    conversacion = entre(remitente_id, receptor_id).first
    return conversacion if conversacion.present?

    create(remitente_id: remitente_id, receptor_id: receptor_id)
  end
 
  # Obtiene al otro usuario con el que tiene la conversación
  def usuario_opuesto(usuario)
    usuario == receptor ? remitente : receptor
  end
end