class DeliverProductsController < ApplicationController
  before_action :set_deliver_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  
  # GET /deliver_products
  # GET /deliver_products.json
  def index
    @deliver_products = DeliverProduct.all
  end

  # GET /deliver_products/1
  # GET /deliver_products/1.json
  def show
  end

  # GET /deliver_products/new
  def new
    @deliver_product = DeliverProduct.new
  end

  # GET /deliver_products/1/edit
  def edit
  end

  # POST /deliver_products
  # POST /deliver_products.json
  def create
    @deliver_product = DeliverProduct.new(deliver_product_params)

    respond_to do |format|
      if @deliver_product.save
        format.html { redirect_to @deliver_product, notice: 'Deliver product was successfully created.' }
        format.json { render :show, status: :created, location: @deliver_product }
      else
        format.html { render :new }
        format.json { render json: @deliver_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deliver_products/1
  # PATCH/PUT /deliver_products/1.json
  def update
    respond_to do |format|
      if @deliver_product.update(deliver_product_params)
        format.html { redirect_to @deliver_product, notice: 'Deliver product was successfully updated.' }
        format.json { render :show, status: :ok, location: @deliver_product }
      else
        format.html { render :edit }
        format.json { render json: @deliver_product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /deliver_products/1
  # DELETE /deliver_products/1.json
  def destroy
    @deliver_product.destroy
    respond_to do |format|
      format.html { redirect_to deliver_products_url, notice: 'Deliver product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deliver_product
      @deliver_product = DeliverProduct.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def deliver_product_params
      params.require(:deliver_product).permit(:delivery_id, :product_id, :delivery_quantity, :price)
    end
end
