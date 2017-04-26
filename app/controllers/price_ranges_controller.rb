class PriceRangesController < ApplicationController
  before_action :set_price_range, only: [:show, :edit, :update, :destroy]

  # GET /price_ranges
  # GET /price_ranges.json
  def index
    @price_ranges = PriceRange.all
  end

  # GET /price_ranges/1
  # GET /price_ranges/1.json
  def show
  end

  # GET /price_ranges/new
  def new
    @price_range = PriceRange.new
  end

  # GET /price_ranges/1/edit
  def edit
  end

  # POST /price_ranges
  # POST /price_ranges.json
  def create
    @price_range = PriceRange.new(price_range_params)

    respond_to do |format|
      if @price_range.save
        format.html { redirect_to @price_range, notice: 'Price range was successfully created.' }
        format.json { render :show, status: :created, location: @price_range }
      else
        format.html { render :new }
        format.json { render json: @price_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /price_ranges/1
  # PATCH/PUT /price_ranges/1.json
  def update
    respond_to do |format|
      if @price_range.update(price_range_params)
        format.html { redirect_to @price_range, notice: 'Price range was successfully updated.' }
        format.json { render :show, status: :ok, location: @price_range }
      else
        format.html { render :edit }
        format.json { render json: @price_range.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /price_ranges/1
  # DELETE /price_ranges/1.json
  def destroy
    @price_range.destroy
    respond_to do |format|
      format.html { redirect_to price_ranges_url, notice: 'Price range was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_price_range
      @price_range = PriceRange.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def price_range_params
      params.require(:price_range).permit(:from, :to)
    end
end
