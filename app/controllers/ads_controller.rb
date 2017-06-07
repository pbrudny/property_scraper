class AdsController < ApplicationController
  before_action :set_ad, only: [:show, :edit, :update, :destroy]

  def index
    @q = Ad.ransack(params[:q])
    @ads = @q.result(distinct: true)
  end

  def show
    @appointment = Appointment.new
  end

  def new
    @ad = Ad.new
  end

  def edit
  end

  def create
    @ad = Ad.new(ad_params)

    respond_to do |format|
      if @ad.save
        format.html { redirect_to @ad, notice: 'Ad was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @ad.update(ad_params)
        format.html { redirect_to @ad, notice: 'Ad was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @ad.destroy
    respond_to do |format|
      format.html { redirect_to ads_url, notice: 'Ad was successfully destroyed.' }
    end
  end

  def load
    Ads::LoadAds.new.call
    redirect_to ads_url, notice: 'Loaded latest ads'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ad
      @ad = Ad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ad_params
      params.require(:ad).permit(:title, :url, :phone, :price, :status, :district_id, :type)
    end
end
