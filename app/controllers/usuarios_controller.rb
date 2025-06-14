class UsuariosController < ApplicationController
  before_action :set_usuario, only: %i[ show edit update destroy ]

  def index
    @usuarios = Usuario.all
  end

  def show; end

  def new
    @usuario = Usuario.new
  end

  def edit; end

  def create
    @usuario = Usuario.new(usuario_params)
    save_and_respond(@usuario, :new)
  end

  def update
    @usuario.assign_attributes(usuario_params)
    save_and_respond(@usuario, :edit)
  end

  def destroy
    @usuario.destroy!
    redirect_to usuarios_path, notice: "Usuário excluído com sucesso.", status: :see_other
  end

  private

  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  def usuario_params
    params.require(:usuario).permit(:nome, :cpf, :telefone, :endereco, :data_nascimento)
  end

  # 🧩 Aqui está o padrão extraído (reutilizável)
  def save_and_respond(resource, render_view)
    respond_to do |format|
      if resource.save
        format.html { redirect_to resource, notice: "Usuário salvo com sucesso." }
        format.json { render :show, status: :ok, location: resource }
      else
        format.html { render render_view, status: :unprocessable_entity }
        format.json { render json: resource.errors, status: :unprocessable_entity }
      end
    end
  end
end
