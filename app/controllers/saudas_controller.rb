class SaudasController < ApplicationController
  before_action :set_sauda, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource

  # GET /saudas
  # GET /saudas.json
  def index
    @saudas = Sauda.all
  end

  # GET /saudas/1
  # GET /saudas/1.json
  def show
  end

  # GET /saudas/new
  def new
    @sauda = Sauda.new
    @sauda_line_item = SaudaLineItem.new
  end

  # GET /saudas/1/edit
  def edit
  end

  # POST /saudas
  # POST /saudas.json
  def create
    @sauda = Sauda.new(sauda_params)

    respond_to do |format|
      if @sauda.save
        format.html { redirect_to @sauda, notice: 'Sauda was successfully created.' }
        format.json { render :show, status: :created, location: @sauda }
      else
        format.html { render :new }
        format.json { render json: @sauda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /saudas/1
  # PATCH/PUT /saudas/1.json
  def update
    respond_to do |format|
      if @sauda.update(sauda_params)
        format.html { redirect_to @sauda, notice: 'Sauda was successfully updated.' }
        format.json { render :show, status: :ok, location: @sauda }
      else
        format.html { render :edit }
        format.json { render json: @sauda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /saudas/1
  # DELETE /saudas/1.json
  def destroy
    @sauda.destroy
    respond_to do |format|
      format.html { redirect_to saudas_url, notice: 'Sauda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sauda
      @sauda = Sauda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sauda_params
      params.require(:sauda).permit(:number, :date, :customer_id, :is_order_taken, :is_delivered, sauda_line_items_attributes: [:id, :category_id, :rate, :quantity, :_destroy])
    end
end
