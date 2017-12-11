class Usuario < ApplicationRecord
  # --------------  CALLBACKS ------------------------------------------------------

	after_create :crear_perfil

  # --------------  MODULOS DE LA GEMA ------------------------------------------------------

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # --------------  RELACIONES CON OTRAS TABLAS ------------------------------------

  has_one :perfil, dependent: :destroy
  has_friendship
  has_many :mensajes, foreign_key: :remitente_id, dependent: :destroy

  # --------------- METODOS DE LA CLASE --------------------------------------------

  private

    # Luego de haber creado un usuario, crea su perfil
  	def crear_perfil
  		Perfil.create(usuario: self)
  	end
end
