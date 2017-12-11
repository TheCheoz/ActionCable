class Perfil < ApplicationRecord
	# --------------  TABLA HA UTILIZAR ----------------------------------------------

	self.table_name = :perfiles

	# --------------  RELACIONES CON OTRAS TABLAS ------------------------------------

	belongs_to :usuario

	#---------------------------------------------------------------------------------                   
  # --------------- METODOS DE LA CLASE --------------------------------------------
  #---------------------------------------------------------------------------------  

  def nombre_y_apellido
  		nombres = primer_nombre ? primer_nombre.squeeze(" ") + ' ' : ''
  		nombres += primer_apellido ? primer_apellido.squeeze(" ") : ''
  end

  #---------------------------------------------------------------------------------  
  
  def nombre_completo
      nombres = primer_nombre ? primer_nombre.squeeze(" ") + ' ' : ''
      nombres += segundo_nombre ? segundo_nombre.squeeze(" ") + ' ' : ''
      nombres += primer_apellido ? primer_apellido.squeeze(" ") + ' ' : ''
      nombres += segundo_apellido ? segundo_apellido.squeeze(" ") + ' ' : ''
  end
end
