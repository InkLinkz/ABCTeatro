class IngressosController < ApplicationController
  before_action :set_ingresso, only: %i[ show edit update destroy ]

  # GET /ingressos or /ingressos.json
  def index
    @ingressos = Ingresso.all
  end

  # GET /ingressos/1 or /ingressos/1.json
  def show
  end

  # GET /ingressos/new
  def new
    @ingresso = Ingresso.new
  end

  # GET /ingressos/1/edit
  def edit
  end

  # POST /ingressos or /ingressos.json
  def create
    @ingresso = Ingresso.new(ingresso_params)

    respond_to do |format|
      if @ingresso.save
        format.html { redirect_to @ingresso, notice: "Ingresso was successfully created." }
        format.json { render :show, status: :created, location: @ingresso }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ingresso.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ingressos/1 or /ingressos/1.json
  def update
    respond_to do |format|
      if @ingresso.update(ingresso_params)
        format.html { redirect_to @ingresso, notice: "Ingresso was successfully updated." }
        format.json { render :show, status: :ok, location: @ingresso }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ingresso.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ingressos/1 or /ingressos/1.json
  def destroy
    @ingresso.destroy!

    respond_to do |format|
      format.html { redirect_to ingressos_path, status: :see_other, notice: "Ingresso was successfully destroyed." }
      format.json { head :no_content }
    end
  end

   def por_cpf
    @usuario = Usuario.find_by(cpf: params[:cpf])
    if @usuario
      @ingressos = @usuario.ingressos.includes(sessao: :peca, area: {})
    else
      flash[:alert] = "Usuário com CPF #{params[:cpf]} não encontrado."
      redirect_to root_path
    end
  end

  private
    
    def set_ingresso
      @ingresso = Ingresso.find(params[:id])
    end

   
    def ingresso_params
      params.require(:ingresso).permit(:usuario_id, :sessao_id, :area_id, :poltrona)
    end
end
