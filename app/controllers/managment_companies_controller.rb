class ManagmentCompaniesController < ApplicationController
  before_action :set_managment_company, only: [:show, :edit, :update, :destroy]

  # GET /managment_companies
  # GET /managment_companies.json
  def index
    @managment_companies = ManagmentCompany.all

    respond_to do |format|
      format.html
      format.csv { render text: @managment_companies.to_csv}
    end
  end

  # GET /managment_companies/1
  # GET /managment_companies/1.json
  def show
  end

  # GET /managment_companies/new
  def new
    @managment_company = ManagmentCompany.new
  end

  # GET /managment_companies/1/edit
  def edit
  end

  def search
    if params.has_key?('search')
      @managment_companies = ManagmentCompany.search(params['search'])
    else
      @managment_companies = []
    end
    params['search'] ||= {}

  end

  # POST /managment_companies
  # POST /managment_companies.json
  def create
    @managment_company = ManagmentCompany.new(managment_company_params)

    respond_to do |format|
      if @managment_company.save
        format.html { redirect_to @managment_company, notice: 'Managment company was successfully created.' }
        format.json { render :show, status: :created, location: @managment_company }
      else
        format.html { render :new }
        format.json { render json: @managment_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /managment_companies/1
  # PATCH/PUT /managment_companies/1.json
  def update
    respond_to do |format|
      if @managment_company.update(managment_company_params)
        format.html { redirect_to @managment_company, notice: 'Managment company was successfully updated.' }
        format.json { render :show, status: :ok, location: @managment_company }
      else
        format.html { render :edit }
        format.json { render json: @managment_company.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /managment_companies/1
  # DELETE /managment_companies/1.json
  def destroy
    @managment_company.destroy
    respond_to do |format|
      format.html { redirect_to managment_companies_url, notice: 'Managment company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def import
    ManagmentCompany.import(params[:file])
    redirect_to managment_companies_path, notice: "Импорт успешен"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_managment_company
      @managment_company = ManagmentCompany.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def managment_company_params
      params.require(:managment_company).permit(:mcname, :address, :director, :phones_of_operators, :phones_of_director,  :latitude, :longitude)
    end
end
