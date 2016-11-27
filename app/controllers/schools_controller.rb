class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  
  @@client = SODA::Client.new({:domain => "data.phila.gov", :app_token => "A2UU0wuMdd6NOSuwVvjSu5i3u"})
  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
    lat = School.find(params[:id]).latitude
    long = School.find(params[:id]).longitude
    @crimes = @@client.get("sspu-uyfa", {"$where" => "within_circle(shape, #{lat}, #{long}, 300) AND ucr_general in ('100', '200', '400', '1400', '1600', '1700', '1800', '1900', '2000', '2400', '2500') AND dispatch_date_time between '#{Time.now.year-3}-#{Time.now.month}-#{Time.now.day}T00:00:00' and '#{Time.now.year}-#{Time.now.month}-#{Time.now.day}T00:00:00'"})

    respond_to do |format|
        format.js
        format.html do
          redirect_to '/'
        end
    end
  end
  
  def crimefilter
    lat = School.find(params[:id]).latitude
    long = School.find(params[:id]).longitude
    classes = params[:classes].join("', '")
    classes = "('" + classes
    classes += "')"
    
    @crimes = @@client.get("sspu-uyfa", {"$where" => "within_circle(shape, #{lat}, #{long}, #{params[:radius_val].to_i*100}) AND dispatch_date_time between '#{Time.now.year-params[:range_val].to_i}-#{Time.now.month}-#{Time.now.day}T00:00:00' and '#{Time.now.year}-#{Time.now.month}-#{Time.now.day}T00:00:00' AND ucr_general in #{classes}"})
    
    respond_to do |format|
        format.js
    end
  end
  
  # GET /schools/new
  def new
    @school = School.new
  end

  # GET /schools/1/edit
  def edit
  end

  # POST /schools
  # POST /schools.json
  def create
    @school = School.new(school_params)

    respond_to do |format|
      if @school.save
        format.html { redirect_to @school, notice: 'School was successfully created.' }
        format.json { render :show, status: :created, location: @school }
      else
        format.html { render :new }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /schools/1
  # PATCH/PUT /schools/1.json
  def update
    respond_to do |format|
      if @school.update(school_params)
        format.html { redirect_to @school, notice: 'School was successfully updated.' }
        format.json { render :show, status: :ok, location: @school }
      else
        format.html { render :edit }
        format.json { render json: @school.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /schools/1
  # DELETE /schools/1.json
  def destroy
    @school.destroy
    respond_to do |format|
      format.html { redirect_to schools_url, notice: 'School was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_school
      @school = School.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def school_params
      params.fetch(:school, {})
    end
end
