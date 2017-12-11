class WelcomeController < ApplicationController

	# GET /
  def index
  	@titulo = "PRUEBA DE APLICACION PRINCIPAL"
    @titulo_icono = "circulo_con_C.png"
  end
end
