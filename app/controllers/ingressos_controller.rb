class IngressosController < ApplicationController
  before_action :set_ingresso, only: %i[show edit update destroy]
  before_action :set_poltronas, only: %i[new edit show]
  
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
    @ingresso.valor = Area.find(@ingresso.area_id).preco if @ingresso.area_id.present?

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


  def estatistica
    @valor_hoje = EstatisticasService.new.valor_total_dia
  end

  private

  def set_ingresso
    @ingresso = Ingresso.find(params[:id])
  end

  def set_poltronas
    if params[:area_id].present?
      @selected_area = Area.includes(:poltronas).find_by(id: params[:area_id])
      @poltronas = @selected_area&.poltronas&.map { |poltrona| [poltrona.numero, poltrona.id] } || []
    elsif @ingresso&.area_id.present?
      @selected_area = Area.includes(:poltronas).find_by(id: @ingresso.area_id)
      @poltronas = @selected_area&.poltronas&.map { |poltrona| [poltrona.numero, poltrona.id] } || []
    else
      @poltronas = []
    end
  end

   
    def ingresso_params
      params.require(:ingresso).permit(:usuario_id, :sessao_id, :area_id, :poltrona_id)
    end
end
