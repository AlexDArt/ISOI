class TransformerSubstationsController < ApplicationController
  before_action :set_transformer_substation, only: [:show, :edit, :update, :destroy]

  # GET /transformer_substations
  # GET /transformer_substations.json
  def index
    @transformer_substations = TransformerSubstation.all
    @boiler_houses = BoilerHouse.all
    @water_intake_unit = WaterIntakeUnit.all
    respond_to do |format|
      format.html
      format.csv { render text: @transformer_substations.to_csv}
    end
  end

  # GET /transformer_substations/1
  # GET /transformer_substations/1.json
  def show
  end

  # GET /transformer_substations/new
  def new
    @transformer_substation = TransformerSubstation.new
    @transformer_substation.boiler_houses.build
    @transformer_substation.water_intake_units.build
    @boiler_house = BoilerHouse.all
    @water_intake_unit = WaterIntakeUnit.all
  end

  # GET /transformer_substations/1/edit
  def edit
  end

  def search
    if params.has_key?('search')
      @transformer_substations = TransformerSubstation.search(params['search'])
    else
      @transformer_substations = []
    end
    params['search'] ||= {}

  end

  # POST /transformer_substations
  # POST /transformer_substations.json
  def create
    @transformer_substation = TransformerSubstation.new(transformer_substation_params)
    @boiler_houses =[]
    @water_intake_units = []
    params[:transformer_substation][:boiler_houses].each{|a| @boiler_houses << BoilerHouse.find(a) if a.present?}
    params[:transformer_substation][:water_intake_units].each{|b| @water_intake_units << WaterIntakeUnit.find(b) if b.present?}
    respond_to do |format|
      if @transformer_substation.save
        @boiler_houses.each {|a| a.transformer_substations << @transformer_substation if !(@transformer_substation.boiler_houses.include?(@boiler_house))}
        @water_intake_units.each {|b| b.transformer_substations << @transformer_substation if !(@transformer_substation.water_intake_units.include?(@water_intake_unit))}
        format.html { redirect_to @transformer_substation, notice: 'Transformer substation was successfully created.' }
        format.json { render :show, status: :created, location: @transformer_substation }
      else
        format.html { render :new }
        format.json { render json: @transformer_substation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transformer_substations/1
  # PATCH/PUT /transformer_substations/1.json
  def update
    @boiler_houses =[]
    @water_intake_units = []
    params[:transformer_substation][:boiler_houses].each{|a| @boiler_houses << BoilerHouse.find(a) if a.present?}
    params[:transformer_substation][:water_intake_units].each{|b| @water_intake_units << WaterIntakeUnit.find(b) if b.present?}
    @transformer_substation = TransformerSubstation.find_by_id(params[:id])
    respond_to do |format|
      if @transformer_substation.update(transformer_substation_params)
        @boiler_houses.each {|a| a.transformer_substations << @transformer_substation if !(@transformer_substation.boiler_houses.include?(@boiler_house))}
        @water_intake_units.each {|b| b.transformer_substations << @transformer_substation if !(@transformer_substation.water_intake_units.include?(@water_intake_unit))}
        format.html { redirect_to @transformer_substation, notice: 'Transformer substation was successfully updated.' }
        format.json { render :show, status: :ok, location: @transformer_substation }
      else
        format.html { render :edit }
        format.json { render json: @transformer_substation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transformer_substations/1
  # DELETE /transformer_substations/1.json
  def destroy
    @transformer_substation.destroy
    respond_to do |format|
      format.html { redirect_to transformer_substations_url, notice: 'Transformer substation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transformer_substation
      @transformer_substation = TransformerSubstation.find(params[:id])
    end

  def import
    TransformerSubstation.import(params[:file])
    redirect_to transformer_substations_path, notice: "Импорт успешен"
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def transformer_substation_params
      params.require(:transformer_substation).permit(:address, :tsnum, :phones_of_operators, :power_supply_center, :latitude, :longitude,
      boiler_houses_attributes: [:address, :bhname, :phones_of_operators, :water_intake_unit_id, :latitude, :longitude], water_intake_units_attributes: [:phones_of_operators, :address, :wiunum, :latitude, :longitude])
    end
end
