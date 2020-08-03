class SocialObjectsController < ApplicationController
  before_action :set_social_object, only: [:show, :edit, :update, :destroy]

  # GET /social_objects
  # GET /social_objects.json
  def index
    @social_objects = SocialObject.all

    respond_to do |format|
      format.html
      format.csv { render text: @social_objects.to_csv}
    end
  end

  # GET /social_objects/1
  # GET /social_objects/1.json
  def show
  end

  # GET /social_objects/new
  def new
    @social_object = SocialObject.new
  end

  # GET /social_objects/1/edit
  def edit
  end

  def search
    if params.has_key?('search')
      @social_objects = SocialObject.search(params['search'])
    else
      @social_objects = []
    end
    params['search'] ||= {}

  end

  # POST /social_objects
  # POST /social_objects.json
  def create
    @social_object = SocialObject.new(social_object_params)

    respond_to do |format|
      if @social_object.save
        format.html { redirect_to @social_object, notice: 'Social object was successfully created.' }
        format.json { render :show, status: :created, location: @social_object }
      else
        format.html { render :new }
        format.json { render json: @social_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /social_objects/1
  # PATCH/PUT /social_objects/1.json
  def update
    respond_to do |format|
      if @social_object.update(social_object_params)
        format.html { redirect_to @social_object, notice: 'Social object was successfully updated.' }
        format.json { render :show, status: :ok, location: @social_object }
      else
        format.html { render :edit }
        format.json { render json: @social_object.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /social_objects/1
  # DELETE /social_objects/1.json
  def destroy
    @social_object.destroy
    respond_to do |format|
      format.html { redirect_to social_objects_url, notice: 'Social object was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    SocialObject.import(params[:file])
    redirect_to social_objects_path, notice: "Импорт успешен"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_social_object
      @social_object = SocialObject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def social_object_params
      params.require(:social_object).permit( :soname, :type_of, :address, :director, :phones_of_operators, :phones_of_director, :redundant_power_supply, 
:maximum_working_shift, :superior_organization, :basement, :attic, :elevators, :boiler_house_id, :transformer_substation_id, :water_intake_unit_id, :latitude, :longitude)
    end
end
