class SessoesController < ApplicationController
  before_action :set_sessao, only: %i[ show edit update destroy ]

  # GET /sessoes or /sessoes.json
  def index
    @sessoes = Sessao.all
  end

  # GET /sessoes/1 or /sessoes/1.json
  def show
  end

  # GET /sessoes/new
  def new
    @sessao = Sessao.new
  end

  # GET /sessoes/1/edit
  def edit
  end

  # POST /sessoes or /sessoes.json
  def create
    @sessao = Sessao.new(sessao_params)

    respond_to do |format|
      if @sessao.save
        format.html { redirect_to @sessao, notice: "Sessao was successfully created." }
        format.json { render :show, status: :created, location: @sessao }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sessao.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sessoes/1 or /sessoes/1.json
  def update
    respond_to do |format|
      if @sessao.update(sessao_params)
        format.html { redirect_to @sessao, notice: "Sessao was successfully updated." }
        format.json { render :show, status: :ok, location: @sessao }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sessao.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessoes/1 or /sessoes/1.json
  def destroy
    @sessao.destroy!

    respond_to do |format|
      format.html { redirect_to sessoes_path, status: :see_other, notice: "Sessao was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sessao
      @sessao = Sessao.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def sessao_params
      params.expect(sessao: [ :peca_id, :horario ])
    end
end
