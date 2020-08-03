class ShoppingCentersController < ApplicationController
  before_action :set_shopping_center, only: [:show, :edit, :update, :destroy]

  # GET /shopping_centers
  # GET /shopping_centers.json
  def index
    @shopping_centers = ShoppingCenter.all
 
    respond_to do |format|
      format.html
      format.csv { render text: @shopping_centers.to_csv}
    end
  end

  # GET /shopping_centers/1
  # GET /shopping_centers/1.json
  def show
  end

  # GET /shopping_centers/new
  def new
    @shopping_center = ShoppingCenter.new
  end

  # GET /shopping_centers/1/edit
  def edit
  end

  def search
    if params.has_key?('search')
      @shopping_centers = ShoppingCenter.search(params['search'])
    else
      @shopping_centers = []
    end
    params['search'] ||= {}

  end

  # POST /shopping_centers
  # POST /shopping_centers.json
  def create
    @shopping_center = ShoppingCenter.new(shopping_center_params)

    respond_to do |format|
      if @shopping_center.save
        format.html { redirect_to @shopping_center, notice: 'Shopping center was successfully created.' }
        format.json { render :show, status: :created, location: @shopping_center }
      else
        format.html { render :new }
        format.json { render json: @shopping_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shopping_centers/1
  # PATCH/PUT /shopping_centers/1.json
  def update
    respond_to do |format|
      if @shopping_center.update(shopping_center_params)
        format.html { redirect_to @shopping_center, notice: 'Shopping center was successfully updated.' }
        format.json { render :show, status: :ok, location: @shopping_center }
      else
        format.html { render :edit }
        format.json { render json: @shopping_center.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shopping_centers/1
  # DELETE /shopping_centers/1.json
  def destroy
    @shopping_center.destroy
    respond_to do |format|
      format.html { redirect_to shopping_centers_url, notice: 'Shopping center was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shopping_center
      @shopping_center = ShoppingCenter.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def shopping_center_params
      params.require(:shopping_center).permit(:address, :scname, :owner, :number_of_floors, :type_of_roof, :number_of_entrances, :maximum_working_shift, :basement, :attic, :underground_parking, :elevator, :boiler_house_id, :transformer_substation_id, :water_intake_unit_id, :latitude, :longitude)
    end
end
