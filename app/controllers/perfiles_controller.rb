class PerfilesController < ApplicationController
  before_action :authenticate_usuario!
  before_action :set_perfil
  before_action :authenticate_perfil!, except: [:show]

  # GET /perfil/
  # GET /perfil/.json
  def show
  end

  # GET /perfil/edit
  def edit
  end

  # PATCH/PUT /perfil/
  # PATCH/PUT /perfil/.json
  def update
    respond_to do |format|
      if @perfil.update(perfil_params)
        format.html { redirect_to perfil_path, notice: 'Perfil was successfully updated.' }
        format.json { render :show, status: :ok, location: @perfil }
      else
        format.html { render :edit }
        format.json { render json: @perfil.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_perfil
      @perfil = Perfil.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def perfil_params
      params.require(:perfil).permit(:primer_nombre, :segundo_nombre, :primer_apellido, :segundo_apellido, :apodo)
    end

    def authenticate_perfil!
      unless @perfil.usuario == current_usuario
        redirect_to root_path
      end
    end
end
