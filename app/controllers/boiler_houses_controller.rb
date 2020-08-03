class BoilerHousesController < ApplicationController
  before_action :set_boiler_house, only: [:show, :edit, :update, :destroy]

  # GET /boiler_houses
  # GET /boiler_houses.json
  def index
    @boiler_houses = BoilerHouse.all
    @transformer_substations = TransformerSubstation.all
    respond_to do |format|
      format.html
      format.csv { render text: @boiler_houses.to_csv}
    end
  end

  # GET /boiler_houses/1
  # GET /boiler_houses/1.json
  def show
  end

  # GET /boiler_houses/new
  def new
    @boiler_house = BoilerHouse.new
    @boiler_house.transformer_substations.build
    @transformer_substations = TransformerSubstation.all
  end

  # GET /boiler_houses/1/edit
  def edit
  end

  def search
    if params.has_key?('search')
      @boiler_houses = BoilerHouse.search(params['search'])
    else
      @boiler_houses = []
    end
    params['search'] ||= {}

  end

  # POST /boiler_houses
  # POST /boiler_houses.json
  def create
    @boiler_house = BoilerHouse.new(boiler_house_params)
    @transformer_substations = []
    params[:boiler_house][:transformer_substations].each{|a| @transformer_substations << TransformerSubstation.find(a) if a.present?}
    respond_to do |format|
      if @boiler_house.save
        @transformer_substations.each {|a| a.boiler_houses << @boiler_house if !(@boiler_house.transformer_substations.include?(@transformer_substation))}
        format.html { redirect_to @boiler_house, notice: 'Boiler house was successfully created.' }
        format.json { render :show, status: :created, location: @boiler_house }
      else
        format.html { render :new }
        format.json { render json: @boiler_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /boiler_houses/1
  # PATCH/PUT /boiler_houses/1.json
  def update
    @transformer_substations = []
    params[:boiler_house][:transformer_substations].each{|a| @transformer_substations << TransformerSubstation.find(a) if a.present?}
    respond_to do |format|
      if @boiler_house.update(boiler_house_params)
        @transformer_substations.each {|a| a.boiler_houses << @boiler_house if !(@boiler_house.transformer_substations.include?(@transformer_substation))}
        format.html { redirect_to @boiler_house, notice: 'Boiler house was successfully updated.' }
        format.json { render :show, status: :ok, location: @boiler_house }
      else
        format.html { render :edit }
        format.json { render json: @boiler_house.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boiler_houses/1
  # DELETE /boiler_houses/1.json
  def destroy
    @boiler_house.destroy
    respond_to do |format|
      format.html { redirect_to boiler_houses_url, notice: 'Boiler house was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    BoilerHouse.import(params[:file])
    redirect_to boiler_houses_path, notice: "Импорт успешен"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_boiler_house
      @boiler_house = BoilerHouse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def boiler_house_params
      params.require(:boiler_house).permit(:address, :bhname, :phones_of_operators, :water_intake_unit_id, :latitude, :longitude, transformer_substation_attributes: [:address, :tsnum, :phones_of_operators, :power_supply_center, :latitude, :longitude])
    end
end
