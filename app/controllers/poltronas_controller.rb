class PoltronasController < ApplicationController
  before_action :set_poltrona, only: %i[ show edit update destroy ]

  # GET /poltronas or /poltronas.json
  def index
    @poltronas = Poltrona.all
  end

  # GET /poltronas/1 or /poltronas/1.json
  def show
  end

  # GET /poltronas/new
  def new
    @poltrona = Poltrona.new
  end

  # GET /poltronas/1/edit
  def edit
  end

  # POST /poltronas or /poltronas.json
  def create
    @poltrona = Poltrona.new(poltrona_params)

    respond_to do |format|
      if @poltrona.save
        format.html { redirect_to @poltrona, notice: "Poltrona was successfully created." }
        format.json { render :show, status: :created, location: @poltrona }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poltrona.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poltronas/1 or /poltronas/1.json
  def update
    respond_to do |format|
      if @poltrona.update(poltrona_params)
        format.html { redirect_to @poltrona, notice: "Poltrona was successfully updated." }
        format.json { render :show, status: :ok, location: @poltrona }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poltrona.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poltronas/1 or /poltronas/1.json
  def destroy
    @poltrona.destroy!

    respond_to do |format|
      format.html { redirect_to poltronas_path, status: :see_other, notice: "Poltrona was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_poltrona
      @poltrona = Poltrona.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def poltrona_params
      params.expect(poltrona: [ :area_id, :numero, :disponivel ])
    end
end
