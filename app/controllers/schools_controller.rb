class SchoolsController < ApplicationController
  before_action :set_school, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, :only => [:new, :submit]
  
  @@client = SODA::Client.new({:domain => "data.phila.gov", :app_token => "A2UU0wuMdd6NOSuwVvjSu5i3u"})
  # GET /schools
  # GET /schools.json
  def index
    @schools = School.all
  end

  # GET /schools/1
  # GET /schools/1.json
  def show
    @school = School.find(params[:id])
    lat = @school.latitude
    long = @school.longitude
    @crimes = @@client.get("sspu-uyfa", {"$where" => "within_circle(shape, #{lat}, #{long}, 300) AND ucr_general in ('100', '200', '400', '1400', '1600', '1700', '1800', '1900', '2000', '2400', '2500') AND dispatch_date_time between '#{Time.now.year-3}-#{Time.now.month}-#{Time.now.day}T00:00:00' and '#{Time.now.year}-#{Time.now.month}-#{Time.now.day}T00:00:00'"})
    
    @score = @crimes.inject(0) { |sum, c|
      if ["100", "200"].include? c["ucr_general"] then
        sum + 5 
      elsif ["1700", "2000"].include? c["ucr_general"] then
        sum + 4
      elsif ["400", "1600", "1800"].include? c["ucr_general"] then
        sum + 3
      elsif ["1400", "1900"].include? c["ucr_general"] then
        sum + 2
      elsif ["2400", "2500"].include? c["ucr_general"] then
        sum + 1
      end
    }
    
    @score = @score.to_f / @crimes.length
    @score = 5 - @score
    @score = @score.to_i
    
    respond_to do |format|
        format.js
        format.html do
          redirect_to '/'
        end
    end
  end
  
  def submit
    review_params = params[:review].permit(:school_id, :title, :rating, :comment)
    @review = current_user.reviews.build(review_params)
    @school = School.find(params[:review][:school_id])
    
    lat = @school.latitude
    long = @school.longitude
    @crimes = @@client.get("sspu-uyfa", {"$where" => "within_circle(shape, #{lat}, #{long}, 300) AND ucr_general in ('100', '200', '400', '1400', '1600', '1700', '1800', '1900', '2000', '2400', '2500') AND dispatch_date_time between '#{Time.now.year-3}-#{Time.now.month}-#{Time.now.day}T00:00:00' and '#{Time.now.year}-#{Time.now.month}-#{Time.now.day}T00:00:00'"})
    
    @score = @crimes.inject(0) { |sum, c|
      if ["100", "200"].include? c["ucr_general"] then
        sum + 5 
      elsif ["1700", "2000"].include? c["ucr_general"] then
        sum + 4
      elsif ["400", "1600", "1800"].include? c["ucr_general"] then
        sum + 3
      elsif ["1400", "1900"].include? c["ucr_general"] then
        sum + 2
      elsif ["2400", "2500"].include? c["ucr_general"] then
        sum + 1
      end
    }
    
    if @review.save then
      flash[:notice] = 'Review was successfully created.'
      respond_to do |format|
        format.js
      end
    else
      flash[:notice] = 'Errors prohibited this review from being saved.'
      respond_to do |format|
        format.js
      end
    end
  end
  
  def crimefilter
    @school = School.find(params[:id])
    lat = School.find(params[:id]).latitude
    long = School.find(params[:id]).longitude
    classes = params[:classes].join("', '")
    classes = "('" + classes
    classes += "')"
    
    @crimes = @@client.get("sspu-uyfa", {"$where" => "within_circle(shape, #{lat}, #{long}, #{params[:radius_val].to_i*100}) AND dispatch_date_time between '#{Time.now.year-params[:range_val].to_i}-#{Time.now.month}-#{Time.now.day}T00:00:00' and '#{Time.now.year}-#{Time.now.month}-#{Time.now.day}T00:00:00' AND ucr_general in #{classes}"})
    
    @score = @crimes.inject(0) { |sum, c|
      if ["100", "200"].include? c["ucr_general"] then
        sum + 5 
      elsif ["1700", "2000"].include? c["ucr_general"] then
        sum + 4
      elsif ["400", "1600", "1800"].include? c["ucr_general"] then
        sum + 3
      elsif ["1400", "1900"].include? c["ucr_general"] then
        sum + 2
      elsif ["2400", "2500"].include? c["ucr_general"] then
        sum + 1
      end
    }
    
    if @crimes.length == 0 then
      @score = 0
    else
      @score = @score.to_f / @crimes.length
    end
    
    @score = 5 - @score
    @score = @score.to_i

    respond_to do |format|
        format.js
    end
  end
  
  # Add and remove favorite recipes
  # for current_user
  def favorite
    type = params[:type]
    @school = School.find(params[:id])
    if type == "favorite"
      current_user.favorites << @school
      redirect_to @school, notice: "You bookmarked #{@school.name}"

    elsif type == "unfavorite"
      current_user.favorites.delete(@school)
      redirect_to @school, notice: "Removed bookmark for #{@school.name}"

    else
      # Type missing, nothing happens
      redirect_to @school, notice: "Nothing happened."
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
