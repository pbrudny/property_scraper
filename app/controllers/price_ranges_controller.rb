class PriceRangesController < ApplicationController
  before_action :set_price_range, only: [:show, :edit, :update, :destroy]

  def index
    @price_ranges = PriceRange.all
  end

  def show
  end

  def new
    @price_range = PriceRange.new
  end

  def edit
  end

  def create
    @price_range = PriceRange.new(price_range_params)

    respond_to do |format|
      if @price_range.save
        format.html { redirect_to @price_range, notice: 'Price range was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @price_range.update(price_range_params)
        format.html { redirect_to @price_range, notice: 'Price range was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @price_range.destroy
    respond_to do |format|
      format.html { redirect_to price_ranges_url, notice: 'Price range was successfully destroyed.' }
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
