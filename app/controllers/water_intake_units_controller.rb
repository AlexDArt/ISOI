class WaterIntakeUnitsController < ApplicationController
  before_action :set_water_intake_unit, only: [:show, :edit, :update, :destroy]

  # GET /water_intake_units
  # GET /water_intake_units.json
  def index
    @water_intake_units = WaterIntakeUnit.all
    @transformer_substations = TransformerSubstation.all
    respond_to do |format|
      format.html
      format.csv { render text: @water_intake_units.to_csv}
    end
  end

  # GET /water_intake_units/1
  # GET /water_intake_units/1.json
  def show
  end

  # GET /water_intake_units/new
  def new
    @water_intake_unit = WaterIntakeUnit.new
    @water_intake_unit.transformer_substations.build
    @transformer_substations = TransformerSubstation.all
  end

  # GET /water_intake_units/1/edit
  def edit
  end

  def search
    if params.has_key?('search')
      @water_intake_units = WaterIntakeUnit.search(params['search'])
    else
      @water_intake_units = []
    end
    params['search'] ||= {}

  end

  # POST /water_intake_units
  # POST /water_intake_units.json
  def create
    @water_intake_unit = WaterIntakeUnit.new(water_intake_unit_params)
    @transformer_substations = []
    params[:water_intake_unit][:transformer_substations].each{|a| @transformer_substations << TransformerSubstation.find(a) if a.present?}
    respond_to do |format|
      if @water_intake_unit.save
        @transformer_substations.each {|a| a.water_intake_units << @water_intake_unit if !(@water_intake_unit.transformer_substations.include?(@transformer_substation))}
        format.html { redirect_to @water_intake_unit, notice: 'Water intake unit was successfully created.' }
        format.json { render :show, status: :created, location: @water_intake_unit }
      else
        format.html { render :new }
        format.json { render json: @water_intake_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /water_intake_units/1
  # PATCH/PUT /water_intake_units/1.json
  def update
    @transformer_substations = []
    params[:water_intake_unit][:transformer_substations].each{|a| @transformer_substations << TransformerSubstation.find(a) if a.present?}
    respond_to do |format|
      if @water_intake_unit.update(water_intake_unit_params)
        @transformer_substations.each {|a| a.water_intake_units << @water_intake_unit if !(@water_intake_unit.transformer_substations.include?(@transformer_substation))}
        format.html { redirect_to @water_intake_unit, notice: 'Water intake unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @water_intake_unit }
      else
        format.html { render :edit }
        format.json { render json: @water_intake_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /water_intake_units/1
  # DELETE /water_intake_units/1.json
  def destroy
    @water_intake_unit.destroy
    respond_to do |format|
      format.html { redirect_to water_intake_units_url, notice: 'Water intake unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    WaterIntakeUnit.import(params[:file])
    redirect_to water_intake_units_path, notice: "Импорт успешен"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_water_intake_unit
      @water_intake_unit = WaterIntakeUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def water_intake_unit_params
      params.require(:water_intake_unit).permit(:phones_of_operators, :address, :wiunum, :latitude, :longitude, transformer_substation_attributes: [:address, :tsnum, :phones_of_operators, :power_supply_center, :latitude, :longitude])
    end

end
